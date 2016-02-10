//
//  GZYEssenceViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYEssenceViewController.h"

@interface GZYEssenceViewController ()

@end

@implementation GZYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //设置背景
    self.view.backgroundColor = GZYGlobalBg;
    
    
    //设置导航标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
  
    //设置导航按钮
    
    UIBarButtonItem *tagButton = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" highlightedImageName:@"MainTagSubIconClick" target:self action:@selector(tagClicked:)];
    

    self.navigationItem.leftBarButtonItem = tagButton;
    
    
}

//导航按钮点击
-(void)tagClicked:(UIButton *)button{
    GZYLogFunc;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIViewController *viewController = [[UIViewController alloc] init];
    
    viewController.view.backgroundColor = GZYRGBColor(200, 100, 50);
    
    
    [self.navigationController pushViewController:viewController animated:YES];
    
   
}



@end
