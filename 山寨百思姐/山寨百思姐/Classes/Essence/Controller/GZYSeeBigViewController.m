//
//  GZYSeeBigViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/29.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYSeeBigViewController.h"
#import "GZYTopic.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import "GZYProgressView.h"

#define GZYScreenW [UIScreen mainScreen].bounds.size.width
#define GZYScreenH [UIScreen mainScreen].bounds.size.height

@interface GZYSeeBigViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,weak)UIImageView *imageView;
@property (weak, nonatomic) IBOutlet GZYProgressView *progressView;

@end

@implementation GZYSeeBigViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.progressView setProgress:self.topic.progress animated:NO];
    

        UIImageView *imageView = [[UIImageView alloc] init];
    
        imageView.frame = self.imageViewOriginFrame;
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.largeImage] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            self.topic.progress = 1.0 * receivedSize / expectedSize;
            [self.progressView setProgress:self.topic.progress animated:NO];
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            self.progressView.hidden = YES;
        }];
        [self.scrollView addSubview:imageView];
    
        self.imageView = imageView;


    self.scrollView.contentSize = CGSizeMake(0, GZYScreenW * self.topic.height / self.topic.width);
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    
}



-(void)viewDidAppear:(BOOL)animated{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 1;
        
        self.imageView.frame = CGRectMake(0, 0, GZYScreenW, GZYScreenW * self.topic.height / self.topic.width);
        if (self.imageView.height < GZYScreenH) {
            self.imageView.center = self.view.center;
            
        }

    }];
   
}



//-(void)setTopic:(GZYTopic *)topic{
//    
//    _topic = topic;
//    
//    GZYLog(@"%@",NSStringFromCGRect(self.view.frame));
//    [self.progressView setProgress:topic.progress animated:NO];
//
//    if (!_imageView) {
//        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.frame = self.imageViewOriginFrame;
//        [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.largeImage] placeholderImage:nil options:SDWebImageCacheMemoryOnly | SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            topic.progress = 1.0 * receivedSize / expectedSize;
//            [self.progressView setProgress:topic.progress animated:NO];
//        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            self.progressView.hidden = YES;
//        }];
//        [self.scrollView addSubview:imageView];
//        _imageView = imageView;
//
//    
//    }
//    
//}


- (IBAction)back{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 0;
        self.imageView.frame = self.imageViewOriginFrame;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (IBAction)save:(UIButton *)sender {
    
    if (self.imageView.image) {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }else{
        [SVProgressHUD showErrorWithStatus:@"图片正在下载"];
    }
 
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (!error) {
        [SVProgressHUD showSuccessWithStatus:@"图片保存成功"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"图片保存失败"];

    }
   
}




@end
