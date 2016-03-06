//
//  GZYGuideView.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/20.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYGuideView.h"

NSString * const versionNumber = @"versionNumber";


@interface GZYGuideView()



@end

@implementation GZYGuideView

+(void)show{

    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] valueForKey:versionNumber];
    
    if (currentVersion != lastVersion) {
        
        GZYGuideView *guideView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        guideView.frame = window.bounds;
        
        [window addSubview:guideView];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:versionNumber];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    

    
}






- (IBAction)buttonClicked:(id)sender {
    
    
    [self removeFromSuperview];
    
}


@end
