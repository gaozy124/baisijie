//
//  GZYRecomendViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/10.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendViewController.h"
#import "GZYRecomendCategory.h"
#import "GZYRecomendUser.h"
#import "GZYRecomendCategoryTableViewCell.h"
#import "GZYRecomendUserTableViewCell.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>

#define GZYSelectedCategory self.categorys[[self.categoryTableView indexPathForSelectedRow].row]



@interface GZYRecomendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *categorys;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSMutableDictionary *params;
@property(nonatomic,strong)GZYRecomendCategory *currentCategory;
@end

@implementation GZYRecomendViewController

static NSString * const recomendCategoryID = @"recomendCategoryCell";
static NSString * const recomendUserID = @"recomendUserCell";

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

-(void)dealloc{
    GZYLogFunc;
    [self.manager.operationQueue cancelAllOperations];
    [self.manager invalidateSessionCancelingTasks:YES];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    self.view.backgroundColor = GZYGlobalBg;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupTableView];
    [self setupRefresh];
    
    
    
    
    //请求左侧数据
    [self loadCategoryTableView];
    
    
    
    
}

-(void)loadCategoryTableView{
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeClear];
    
    NSMutableDictionary *params =  [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                   @"a":@"category",
                                                                                   @"c":@"subscribe"
                                                                                   }];
    
   [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
     
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    
                                    
                                    
                                    
                                    self.categorys = [GZYRecomendCategory categorysWithDicArray:responseObject[@"list"]];
                                    [self.categoryTableView reloadData];
                                    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
                                    [self tableView:self.categoryTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
                                    [SVProgressHUD dismiss];
                                    
                                    
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    
                                    
                                    [SVProgressHUD showErrorWithStatus:@"网络请求失败"];
                                    
                                }];
 
}


-(void)setupRefresh{
    
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    self.userTableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.userTableView.mj_footer.hidden = YES;
    
    
}






-(void)setupTableView{
    //设置左侧类别tableview属性，注册cell
    self.categoryTableView.backgroundColor = [UIColor clearColor];
    self.categoryTableView.showsVerticalScrollIndicator = NO;
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYRecomendCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:recomendCategoryID];
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    //设置右侧tableview属性，注册cell
    self.userTableView.backgroundColor = [UIColor clearColor];
    self.userTableView.showsVerticalScrollIndicator = NO;
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYRecomendUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:recomendUserID];
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
  
}


-(void)checkFooterState{

    GZYRecomendCategory *category = GZYSelectedCategory;
    if (category.users.count == category.total) {
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.userTableView.mj_footer endRefreshing];
    }
  
}


-(void)loadNewUsers{
    
    GZYRecomendCategory *category = GZYSelectedCategory;
    
    
    NSMutableDictionary *params =  [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                   @"a":@"list",
                                                                                   @"c":@"subscribe",
                                                                                   @"category_id":@(category.id),
                                                                                   @"page":@(1)
                                                                                   }];
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    
                                    if (self.params != params) return;
                                    
                                    category.total = [responseObject[@"total"] integerValue];
                                    NSArray *users = [GZYRecomendUser usersWithDicArray:responseObject[@"list"]];
                                    [category.users removeAllObjects];
                                    [category.users addObjectsFromArray:users];
                                    
                                    
                                    [self.userTableView reloadData];
                                    
                                    [self.userTableView.mj_header endRefreshing];

                                    category.currentPage = 1;

     
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    
                                    if (self.params != params) return;
                                    [self.userTableView.mj_header endRefreshing];
                                    [self.userTableView reloadData];
                                    [SVProgressHUD showErrorWithStatus:@"刷新失败"];
                                }];
  
    
}


-(void)loadMoreUsers{
    
    GZYRecomendCategory *category = GZYSelectedCategory;
   

    
        NSMutableDictionary *params =  [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                       @"a":@"list",
                                                                                       @"c":@"subscribe",
                                                                                       @"category_id":@(category.id),
                                                                                       @"page":@(category.currentPage+1)
                                                                                       }];
        self.params = params;
        [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
                                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                        if (self.params != params) return;
                                        
                                        NSArray *users = [GZYRecomendUser usersWithDicArray:responseObject[@"list"]];
                                        [category.users addObjectsFromArray:users];
                                        
                                        [self.userTableView.mj_header endRefreshing];
                                        
                                        [self.userTableView reloadData];
                                        
                                        category.currentPage++;
                                        
     
                                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                        if (self.params != params) return;
                                        [self.userTableView reloadData];
                                        [self.userTableView.mj_header endRefreshing];
                                        [SVProgressHUD showErrorWithStatus:@"刷新失败"];
                                        NSLog(@"右侧网络请求失败");
                                    }];
    }



#pragma mark - <UITableViewDataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView) {
        return self.categorys.count;
    }else{
        GZYRecomendCategory *category = GZYSelectedCategory;
        self.currentCategory = category;
        self.userTableView.mj_footer.hidden = (category.users.count == 0);
        [self checkFooterState];
        return category.users.count;

    }
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.categoryTableView) {
        GZYRecomendCategoryTableViewCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:recomendCategoryID];
        categoryCell.category = self.categorys[indexPath.row];
        return categoryCell;
    }else{
        GZYRecomendCategory *category = self.currentCategory;
        GZYRecomendUserTableViewCell *userCell = [tableView dequeueReusableCellWithIdentifier:recomendUserID];
        userCell.user = category.users[indexPath.row];
        return userCell;
    }
   

}


#pragma mark - <UITableViewDelegate>


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.categoryTableView) {
        [self.manager.operationQueue cancelAllOperations];
        [self.userTableView.mj_header endRefreshing];
        [self.userTableView.mj_footer endRefreshing];
        [self.userTableView reloadData];
    
        if (![self.categorys[indexPath.row] users].count) {

            [self.userTableView.mj_header beginRefreshing];

    }
    
    }
    

}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView && [self.categoryTableView indexPathForSelectedRow] == indexPath) {
        return nil;
    }
    return indexPath;
    
}







@end
