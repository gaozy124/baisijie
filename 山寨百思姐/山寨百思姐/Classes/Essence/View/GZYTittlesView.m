//
//  GZYTittlesView.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/19.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYTittlesView.h"



@implementation GZYTittlesView


-(UIView *)indicatorView{
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        _indicatorView.backgroundColor = [UIColor redColor];
        
        
    }
    
    return _indicatorView;
    
    
}

-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
   
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
        self.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.indicatorView];
    }
    

    return self;
  
}

+(instancetype)tittlesViewWithViewController:(UIViewController *)target action:(SEL)action{
    
    GZYTittlesView *tittlesView = [[GZYTittlesView alloc] init];
    NSInteger i = 0;
    
    for (UIViewController *vc in target.childViewControllers) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:vc.title forState:UIControlStateNormal];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = i;
        
        [tittlesView addSubview:button];
        [tittlesView.buttons addObject:button];
        
        i++;
    }
    
//    NSInteger buttonNumber = tittlesView.buttons.count;
//    tittlesView.contentSize = CGSizeMake(buttonNumber*[UIScreen mainScreen].bounds.size.width/5, 0);
//    CGFloat width = [UIScreen mainScreen].bounds.size.width/5;
//    CGFloat height = 35;
//    
//    for (UIButton *button in tittlesView.buttons) {
//        CGFloat x = button.tag * width;
//        button.frame = CGRectMake(x, 0, width, height);
//        
//    }
//    
//    UIButton *startButton = tittlesView.buttons[0];
//    [startButton layoutIfNeeded];
//
//    
//    CGFloat x =  startButton.frame.origin.x + startButton.titleLabel.frame.origin.x;
//    CGFloat y = CGRectGetMaxY(startButton.frame) - 2;
//    CGFloat indWidth = startButton.titleLabel.frame.size.width;
//    CGFloat indHeight = 2;
//    
//    
//    tittlesView.indicatorView.frame = CGRectMake(x, y, indWidth, indHeight);
//    
//    NSLog(@"%@",NSStringFromCGRect(tittlesView.indicatorView.frame));
    
    return tittlesView;
   
}



-(void)layoutSubviews{
    [super layoutSubviews];

    NSInteger buttonNumber = self.buttons.count;
    self.contentSize = CGSizeMake(buttonNumber*[UIScreen mainScreen].bounds.size.width/6, 0);
    CGFloat width = [UIScreen mainScreen].bounds.size.width/6;
    CGFloat height = self.height;
    
    UIButton *selectedButton = nil;
    for (UIButton *button in self.buttons) {
        if (!button.isEnabled) {
            selectedButton = button;
        }
        CGFloat x = button.tag * width;
        button.frame = CGRectMake(x, 0, width, height);
        
    }
        
    CGFloat x =  selectedButton.frame.origin.x + selectedButton.titleLabel.frame.origin.x;
    CGFloat y = self.height - 2;
    CGFloat indWidth = selectedButton.titleLabel.frame.size.width;
    CGFloat indHeight = 2;
        
        
    self.indicatorView.frame = CGRectMake(x, y, indWidth, indHeight);



 
}

-(void)setPositonOfIndicatorView:(NSInteger)positonOfIndicatorView{
    
    _positonOfIndicatorView = positonOfIndicatorView;
    
    CGFloat x = [self.buttons[positonOfIndicatorView] frame].origin.x + [self.buttons[positonOfIndicatorView] titleLabel].frame.origin.x;
    CGFloat width = [self.buttons[positonOfIndicatorView] titleLabel].frame.size.width;

    
    [UIView animateWithDuration:0.2 animations:^{
        self.indicatorView.x = x;
        self.indicatorView.width = width;
    }];
    
    
}











@end
