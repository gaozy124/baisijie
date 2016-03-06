//
//  GZYFriendTrendsViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYFriendTrendsViewController.h"
#import "GZYRecomendViewController.h"
#import "GZYLoginAndRegisterViewController.h"

@interface GZYFriendTrendsViewController ()

@end

@implementation GZYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //设置背景
    self.view.backgroundColor = GZYGlobalBg;
    
    
    //设置导航标题
    self.navigationItem.title = @"我的关注";
    
    
    //设置导航按钮
    
    UIBarButtonItem *friendButton = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" highlightedImageName:@"friendsRecommentIcon-click" target:self action:@selector(friendClicked:)];
    
    
    self.navigationItem.leftBarButtonItem = friendButton;

    
    
}

//导航按钮点击
-(void)friendClicked:(UIButton *)button{
    
    GZYRecomendViewController *vc = [[GZYRecomendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (IBAction)loginButtonClicked:(id)sender {
    
    GZYLoginAndRegisterViewController *vc = [[GZYLoginAndRegisterViewController  alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
    
    
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    UIViewController *viewController = [[UIViewController alloc] init];
//    
//    viewController.view.backgroundColor = GZYRGBColor(200, 100, 50);
//    
//    
//    [self.navigationController pushViewController:viewController animated:YES];
//    
//    
//}

@end
