//
//  GZYFriendTrendsViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYFriendTrendsViewController.h"

@interface GZYFriendTrendsViewController ()

@end

@implementation GZYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航标题
    self.navigationItem.title = @"我的关注";
    
    
    //设置导航按钮
    
    UIBarButtonItem *friendButton = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" highlightedImageName:@"friendsRecommentIcon-click" target:self action:@selector(friendClicked:)];
    
    
    self.navigationItem.leftBarButtonItem = friendButton;

    
    
}

//导航按钮点击
-(void)friendClicked:(UIButton *)button{
    GZYLogFunc;
}


@end
