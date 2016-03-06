//
//  GZYPictureView.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/28.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYPictureView.h"
#import "GZYTopic.h"
#import <UIImageView+WebCache.h>
#import "GZYSeeBigViewController.h"
#import "GZYProgressView.h"

@interface GZYPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *gifView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;

@property (weak, nonatomic) IBOutlet GZYProgressView *progressView;


@end




@implementation GZYPictureView

+ (instancetype)pictureView
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
    
    [self.progressView setProgress:topic.progress animated:NO];
    self.progressView.hidden = (topic.progress == 1);
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.largeImage] placeholderImage:nil options:SDWebImageCacheMemoryOnly | SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {

        topic.progress = receivedSize * 1.0/ expectedSize;
        
        if (self.topic != topic) return;

        
        self.progressView.hidden = NO;
        [self.progressView setProgress:topic.progress animated:NO];
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
        
        if (topic.isBigPicture) {
            
            CGSize size = CGSizeMake(topic.pictureFrame.size.width, topic.pictureFrame.size.width * topic.height / topic.width);
            
            UIGraphicsBeginImageContextWithOptions(topic.pictureFrame.size, YES, 0.0);
            
            [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
            
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            self.imageView.image = newImage;
            
        }

        
    }];
    
    self.gifView.hidden = !topic.is_gif;
    
    self.seeBigButton.hidden = !topic.isBigPicture;
    
    
    
}



@end
