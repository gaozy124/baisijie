//
//  GZYPublishView.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/3/5.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYPublishView.h"
#import "GZYLoginButton.h"
#import <POP.h>

#define GZYButtonW 72
#define GZYButtonH 100
#define GZYScreenW [UIScreen mainScreen].bounds.size.width
#define GZYScreenH [UIScreen mainScreen].bounds.size.height
#define MaxCols 3
#define Margin 20
#define GZYDuration 0.1


@implementation GZYPublishView

UIWindow *window_ = nil;

-(void)awakeFromNib{
    GZYLogFunc;
    
    NSArray *images = @[@"publish-video",@"publish-audio",@"publish-picture",@"publish-text",@"publish-review",@"publish-offline"];
    NSArray *tittles = @[@"发视频",@"发声音",@"发图片",@"发段子",@"审帖",@"下载"];
    
    for (NSInteger i = 0; i<images.count; i++) {
        
        
        GZYLoginButton *button = [[GZYLoginButton alloc] init];
        [button setTitle:tittles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [self addSubview:button];
        
        NSInteger row = i / MaxCols;
        NSInteger col = i % MaxCols;
        CGFloat buttonMargin = (GZYScreenW - 2 * Margin - GZYButtonW * MaxCols) / (MaxCols - 1);
        
        CGFloat buttonX = Margin + (GZYButtonW + buttonMargin) * col;
        CGFloat buttonY = (GZYScreenH - 2 * GZYButtonH) / 2 + GZYButtonH * row;
        CGFloat buttonW = GZYButtonW;
        CGFloat buttonH = GZYButtonH;
//        CGFloat buttonCenterX = buttonX + buttonW / 2;
//        CGFloat buttonCenterY = buttonY + buttonH / 2;
//        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, -buttonH, buttonW, buttonH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        anim.springBounciness = 10;
        anim.springSpeed = 10;
        anim.beginTime = CACurrentMediaTime() + i * GZYDuration;

        
        [button pop_addAnimation:anim forKey:nil];
        GZYLog(@"%@",NSStringFromCGRect(button.frame));
        
    }
    
    UIImageView *slogonView = [[UIImageView alloc] init];
    slogonView.image = [UIImage imageNamed:@"app_slogan"];

    [self addSubview:slogonView];
    
    CGFloat slogonW = 202;
    CGFloat slogonH = 20;
    CGFloat slogonX = (GZYScreenW - slogonW) /2 ;
    CGFloat slogonY = GZYScreenH * 0.2;
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(slogonX, -slogonH, slogonW, slogonH)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(slogonX, slogonY, slogonW, slogonH)];;
    anim.springBounciness = 10;
    anim.springSpeed = 10;
    anim.beginTime = CACurrentMediaTime() + images.count * GZYDuration;
    [anim setCompletionBlock:^(POPAnimation *animation, BOOL completed) {
        self.userInteractionEnabled = YES;
    }];
    
    
    [slogonView pop_addAnimation:anim forKey:nil];
    

    
   
    
}

+(void)show{
    
   GZYPublishView *publishView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    publishView.autoresizingMask = UIViewAutoresizingNone;
    
    publishView.userInteractionEnabled = NO;
    
    window_ = [[UIWindow alloc] init];
    
    window_.backgroundColor = [UIColor clearColor];
    
    window_.bounds = [UIScreen mainScreen].bounds;
    
    publishView.frame = window_.bounds;
    
    [window_ addSubview:publishView];
    
    window_.hidden = NO;
    
    
}

- (IBAction)cancle:(id)sender {
    
    self.userInteractionEnabled = NO;
    
    for (NSInteger i = 2; i<self.subviews.count; i++) {
        
        UIView *subview = self.subviews[i];
        
        CGFloat centerX = subview.centerX;
        CGFloat centerY = subview.centerY;
        
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        
        anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, GZYScreenH + subview.height / 2)];
        anim.duration = 0.25;
        anim.beginTime = CACurrentMediaTime() + (i - 2) * GZYDuration;

        if (i == self.subviews.count - 1) {
            [anim setCompletionBlock:^(POPAnimation *animation, BOOL completed) {
                window_.hidden = YES;
                window_ = nil;
            }];
        }
        
        
        [subview pop_addAnimation:anim forKey:nil];
        
        
        
    }
    
   
}



@end
