//
//  GZYTopicViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/27.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYTopicViewController.h"
#import <MJRefresh.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "GZYTopic.h"
#import "GZYTopicCell.h"


@interface GZYTopicViewController ()

@property(nonatomic,copy)NSString *maxtime;
@property(nonatomic,strong)NSMutableArray *topics;
@property(nonatomic,strong)NSDictionary *params;




@end

@implementation GZYTopicViewController

static NSString * const pictureCellID = @"pictureCellID";
static NSString * const voiceCellID = @"voiceCellID";
static NSString * const videoCellID = @"videoCellID";
static NSString * const wordCellID = @"wordCellID";




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupRefresh];
    
    
}

-(void)setupTableView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(GZYTittlesViewY+GZYTittlesViewH, 0, self.tabBarController.tabBar.height, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYTopicCell class])  bundle:nil] forCellReuseIdentifier:wordCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYTopicCell class])  bundle:nil] forCellReuseIdentifier:pictureCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYTopicCell class])  bundle:nil] forCellReuseIdentifier:voiceCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYTopicCell class])  bundle:nil] forCellReuseIdentifier:videoCellID];
    
   
}

-(void)setupRefresh{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    
  
}

-(void)loadNewTopics{
    [self.tableView.mj_footer endRefreshing];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                  @"a":@"list",
                                                                                  @"c":@"data",
                                                                                  @"type":@(self.type)
                                                                                  }];
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params != params) return;

        self.maxtime = responseObject[@"info"][@"maxtime"];
        self.topics = [GZYTopic topicsWithDictArray:responseObject[@"list"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        
    }];
    
    
    
    
    
}

-(void)loadMoreTopics{
    [self.tableView.mj_header endRefreshing];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                  @"a":@"list",
                                                                                  @"c":@"data",
                                                                                  @"type":@(self.type),
                                                                                  @"maxtime":self.maxtime
                                                                                  }];
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params != params) return;
        
        self.maxtime = responseObject[@"info"][@"maxtime"];
        NSArray *topics = [GZYTopic topicsWithDictArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:topics];
        

        [self.tableView reloadData];

    
        [self.tableView.mj_footer endRefreshing];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        
    }];
    
    
  
    
}



#pragma mark - <UITableViewDataSource>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    self.tableView.mj_footer.hidden = (self.topics.count == 0);

    return self.topics.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GZYTopic *topic = self.topics[indexPath.row];
    GZYTopicCell *cell = nil;
    
    switch (topic.type) {
        case GZYTopicTypePicture:
            cell = [self.tableView dequeueReusableCellWithIdentifier:pictureCellID];
            break;
        case GZYTopicTypeSound:
            cell = [self.tableView dequeueReusableCellWithIdentifier:voiceCellID];
            break;
        case GZYTopicTypeVideo:
            cell = [self.tableView dequeueReusableCellWithIdentifier:videoCellID];
            break;
        default:
            cell = [self.tableView dequeueReusableCellWithIdentifier:wordCellID];
            break;
    }
    
    cell.topic = self.topics[indexPath.row];
    
    return cell ;

    
    
}

#pragma mark - <UITableViewDelegate>


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GZYLogFunc;
    
    return [self.topics[indexPath.row] cellHeight];

   
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 2000;
    
}


@end
