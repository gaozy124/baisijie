//
//  GZYRecomendTagsViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/14.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendTagsViewController.h"
#import "GZYRecomendTagCell.h"
#import "GZYRecomendTag.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface GZYRecomendTagsViewController ()

@property(nonatomic,strong)NSArray *tags;

@end

static NSString * const tagCellID = @"GZYRecomendTagCell";

@implementation GZYRecomendTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self loadTags];
}


-(void)setupTableView{
    
    self.title = @"推荐标签";
    self.tableView.backgroundColor = GZYGlobalBg;
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GZYRecomendTagCell class]) bundle:nil] forCellReuseIdentifier:tagCellID];
    
    
}



-(void)loadTags{
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
    NSDictionary *params = @{@"a":@"tags_list",@"c":@"subscribe"};
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tags = [GZYRecomendTag tagsWithDicArray:responseObject[@"rec_tags"]];
            [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
    }];
    
    
    
    
    
    
    
    
}



#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZYRecomendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:tagCellID];
    
    cell.recomendTag = self.tags[indexPath.row];
    
    return cell;
}


@end
