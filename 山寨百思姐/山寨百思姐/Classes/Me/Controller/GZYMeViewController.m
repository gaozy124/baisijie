//
//  GZYMeViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYMeViewController.h"

@interface GZYMeViewController ()

@end

@implementation GZYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置背景
    self.view.backgroundColor = GZYGlobalBg;
    
    
    //设置导航标题
    self.navigationItem.title = @"我的";
    
    
    //设置导航按钮
    
    UIBarButtonItem *settingButton = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" highlightedImageName:@"mine-setting-icon-click" target:self action:@selector(settingClicked:)];
    UIBarButtonItem *nightButton = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" highlightedImageName:@"mine-moon-icon-click" target:self action:@selector(nightClicked:)];
    
    
    self.navigationItem.rightBarButtonItems=@[settingButton,nightButton];
}

//导航按钮点击
-(void)settingClicked:(UIButton *)button{
    GZYLogFunc;
}

-(void)nightClicked:(UIButton *)button{
    GZYLogFunc;
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIViewController *viewController = [[UIViewController alloc] init];
    
    viewController.view.backgroundColor = GZYRGBColor(200, 100, 50);
    
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

@end
