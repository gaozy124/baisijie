//
//  GZYViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYTabBarController.h"
#import "GZYEssenceViewController.h"
#import "GZYNewViewController.h"
#import "GZYFriendTrendsViewController.h"
#import "GZYMeViewController.h"
#import "GZYTabBar.h"
#import "GZYNavigationController.h"

@interface GZYTabBarController ()

@end

@implementation GZYTabBarController


+(void)initialize{
    
    //统一设置字体属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self setupVc:[[GZYEssenceViewController alloc] init] tittle:@"精华" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
    [self setupVc:[[GZYNewViewController alloc] init] tittle:@"新帖" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"];
    [self setupVc:[[GZYFriendTrendsViewController alloc] init] tittle:@"关注" imageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon"];
    [self setupVc:[[GZYMeViewController alloc] init] tittle:@"我" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"];
    
    
    //设置TabBar
    GZYTabBar *tabBar = [[GZYTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];

    
}

//添加子控制器方法
-(void)setupVc:(UIViewController *)vc tittle:(NSString *)tittle imageName:(NSString *)imageName selectedImageName:(NSString *)seletedImageName{
    
    vc.tabBarItem.title = tittle;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:seletedImageName];
    
    
    GZYNavigationController *nav = [[GZYNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];

    
}










@end
