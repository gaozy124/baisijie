//
//  GZYVideoView.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/3/5.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GZYTopic;

@interface GZYVideoView : UIView

@property(nonatomic,strong)GZYTopic *topic;


+ (instancetype)videoView;


@end
