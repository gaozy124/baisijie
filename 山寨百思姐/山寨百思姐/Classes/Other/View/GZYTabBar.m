//
//  GZYTabBar.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYTabBar.h"


@interface GZYTabBar()

@property(nonatomic,strong) UIButton *publishButton;


@end

@implementation GZYTabBar


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        
        
        //创建中心按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        self.publishButton = publishButton;
        
        [self addSubview:self.publishButton];
    }
    
    
    return self;
}


//设置按钮布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    //设置中心按钮布局
    self.publishButton.size = self.publishButton.currentImage.size;
    self.publishButton.center = CGPointMake(self.width/2, self.height/2);
    
    
    
    //设置4个自动生成按钮布局
    CGFloat buttonW = self.width/5;
    CGFloat buttonH = self.height;
    
    NSInteger index = 0;
    
    for (UIView *button in self.subviews){
        
        if ([button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (index == 2) {
                index++;
            }
            
            button.frame = CGRectMake(buttonW*index, 0, buttonW, buttonH);
            
            index++;
            
        }
        
        
        
        
    }
    
    
}

@end
