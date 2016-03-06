//
//  GZYTittlesView.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/19.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZYTittlesView : UIScrollView

@property(nonatomic,strong)NSMutableArray *buttons;
@property(nonatomic,strong)UIView *indicatorView;
@property(nonatomic,assign)NSInteger positonOfIndicatorView;

+(instancetype)tittlesViewWithViewController:(UIViewController *)target action:(SEL)action;




@end
