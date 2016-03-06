//
//  GZYVoiceView.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/3/5.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYVoiceView.h"
#import "GZYTopic.h"
#import <UIImageView+WebCache.h>
#import "GZYSeeBigViewController.h"

@interface GZYVoiceView()

@property (weak, nonatomic) IBOutlet UILabel *playCount;

@property (weak, nonatomic) IBOutlet UILabel *voiceTime;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;




@end

@implementation GZYVoiceView

+ (instancetype)voiceView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBig)]];
    
    
}

-(void)seeBig{
    
    GZYSeeBigViewController *vc = [[GZYSeeBigViewController alloc] init];
    //    vc.view.frame = [UIScreen mainScreen].bounds;
    vc.imageViewOriginFrame = [self convertRect:self.imageView.frame toView:self.window.rootViewController.view];
    vc.topic = self.topic;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:NO completion:nil];
    
}


-(void)setTopic:(GZYTopic *)topic{
    
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.largeImage]];
    
    if (topic.playcount > 10000) {
        NSString *count = [NSString stringWithFormat:@"%.1f万次播放",topic.playcount / 10000.0];
        self.playCount.text = count;
    }else{
        
        self.playCount.text = [NSString stringWithFormat:@"%zd次播放",topic.playcount];
    }
    
    NSInteger minute = topic.voicetime / 60;
    NSInteger second = topic.voicetime % 60;
    
    self.voiceTime.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];

    

    
}











@end
