//
//  GZYNavigationController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/10.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYNavigationController.h"

@implementation GZYNavigationController


-(void)viewDidLoad{

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    //统一设置返回按钮
    if (self.childViewControllers.count > 0) {
    
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        button.size = CGSizeMake(80, 50);
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button sizeToFit];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
        
    }

    
  
    [super pushViewController:viewController animated:animated];

}

+(void)initialize{
    
    //统一设置导航栏图片
    UINavigationBar *navBarAppearance = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [navBarAppearance setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
 
}

-(void)back:(UIButton *)button{
    [self popViewControllerAnimated:YES];
}




@end
