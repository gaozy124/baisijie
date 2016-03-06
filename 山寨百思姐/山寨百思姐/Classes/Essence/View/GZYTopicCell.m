//
//  GZYTopicCell.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/28.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYTopicCell.h"
#import <UIImageView+WebCache.h>
#import "GZYPictureView.h"
#import "GZYVoiceView.h"
#import "GZYVideoView.h"

@interface GZYTopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *GZYTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isVip;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *comment;
@property (nonatomic,weak) GZYPictureView *pictureView;
@property (nonatomic,weak) GZYVoiceView *voiceView;
@property (nonatomic,weak) GZYVideoView *videoView;



@end



@implementation GZYTopicCell

- (void)awakeFromNib {

    self.headerImage.layer.cornerRadius = self.headerImage.width/2;
    self.headerImage.layer.masksToBounds = YES;
    self.GZYTextLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 2*GZYTopicCellMargin;
   
}

- (GZYPictureView *)pictureView
{
    if (!_pictureView) {
        GZYPictureView *pictureView = [GZYPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

- (GZYVoiceView *)voiceView
{
    if (!_voiceView) {
        GZYVoiceView *voiceView = [GZYVoiceView voiceView];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;
}

- (GZYVideoView *)videoView
{
    if (!_videoView) {
        GZYVideoView *videoView = [GZYVideoView videoView];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
    }
    return _videoView;
}



-(void)setFrame:(CGRect)frame{
    
    frame.origin.y += GZYTopicCellMargin;
    frame.size.height -= GZYTopicCellMargin;
    
    [super setFrame:frame];
    
    
}




-(void)setTopic:(GZYTopic *)topic{
    
    
    _topic = topic;
    
    
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:nil options:0];
    
    self.nameLabel.text = topic.name;
    

    self.dateLabel.text = [NSDate convertDateWithString:topic.created_at];
    
    self.GZYTextLabel.text = topic.text;
    
    self.isVip.hidden = !topic.sina_v;
    
    
    [self setupButton:self.ding withTittle:@"顶" andNumber:topic.ding];
    [self setupButton:self.cai withTittle:@"踩" andNumber:topic.cai];
    [self setupButton:self.comment withTittle:@"评论" andNumber:topic.comment];
    
    
    [self setupCenterView:topic];
    
 
    
}

-(void)setupButton:(UIButton *)button withTittle:(NSString *)tittle andNumber:(NSInteger)number{
    
    if (number > 10000) {
        NSString *tittle = [NSString stringWithFormat:@"%.1f万",number / 10000.0];
        [button setTitle:tittle forState:UIControlStateNormal];
    }else if (number == 0){
        [button setTitle:tittle forState:UIControlStateNormal];
    }else{
        [button setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    }

}

-(void)setupCenterView:(GZYTopic *)topic{
    
    
    switch (topic.type) {
            
        case GZYTopicTypePicture:
            
            if (!topic.cellHeight) {
                [self layoutIfNeeded];
                CGFloat pictureX = GZYTopicCellMargin;
                CGFloat pictureY = CGRectGetMaxY(self.GZYTextLabel.frame);
                CGFloat pictureW = [UIScreen mainScreen].bounds.size.width - 2*GZYTopicCellMargin;
                CGFloat pictureH = pictureW * topic.height / topic.width;
                
                if (self.GZYTextLabel.height > GZYLabelSingleLineH) {
                    pictureY += GZYTopicCellMargin;
                }
                
                if (pictureH > GZYPictureMaxH) {
                    pictureH = GZYPictureStandardH;
                    topic.bigPicture = YES;
                }
                topic.pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
                
                topic.cellHeight = CGRectGetMaxY(topic.pictureFrame) + 2*GZYTopicCellMargin + GZYTopicCellBottomBarH;
                
            }
            
            self.pictureView.topic = topic;
            
            self.pictureView.frame = topic.pictureFrame;
            break;
            
        case GZYTopicTypeSound:
            
            if (!topic.cellHeight) {
                [self layoutIfNeeded];
                
                CGFloat voiceX = GZYTopicCellMargin;
                CGFloat voiceY = CGRectGetMaxY(self.GZYTextLabel.frame);
                CGFloat voiceW = [UIScreen mainScreen].bounds.size.width - 2*GZYTopicCellMargin;
                CGFloat voiceH = voiceW * topic.height / topic.width;
                
                if (self.GZYTextLabel.height > GZYLabelSingleLineH) {
                    voiceY += GZYTopicCellMargin;
                }
                
                topic.voiceFrame = CGRectMake(voiceX, voiceY, voiceW, voiceH);
                
                topic.cellHeight = CGRectGetMaxY(topic.voiceFrame) + 2*GZYTopicCellMargin + GZYTopicCellBottomBarH;
                
            }
            
            self.voiceView.topic = topic;
            
            self.voiceView.frame = topic.voiceFrame;
            
            break;
            
        case GZYTopicTypeVideo:

            if (!topic.cellHeight) {
                [self layoutIfNeeded];
                CGFloat videoX = GZYTopicCellMargin;
                CGFloat videoY = CGRectGetMaxY(self.GZYTextLabel.frame);
                CGFloat videoW = [UIScreen mainScreen].bounds.size.width - 2*GZYTopicCellMargin;
                CGFloat videoH = videoW * topic.height / topic.width;
                
                if (self.GZYTextLabel.height > GZYLabelSingleLineH) {
                    videoY += GZYTopicCellMargin;
                }
                

                topic.videoFrame = CGRectMake(videoX, videoY, videoW, videoH);
                
                topic.cellHeight = CGRectGetMaxY(topic.videoFrame) + 2*GZYTopicCellMargin + GZYTopicCellBottomBarH;
                
            }
            
            self.videoView.topic = topic;
            
            self.videoView.frame = topic.videoFrame;
            
            break;
            
        default:
            
            topic.cellHeight = 400;
            
            break;
    }

 
    
}





@end
