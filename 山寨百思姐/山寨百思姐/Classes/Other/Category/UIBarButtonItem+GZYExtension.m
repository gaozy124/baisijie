//
//  UIBarButtonItem+GZYExtension.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/10.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "UIBarButtonItem+GZYExtension.h"

@implementation UIBarButtonItem (GZYExtension)

+(instancetype)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName  target:(id)target action:(SEL)action{
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = button.currentBackgroundImage.size;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItem;
}




@end
