//
//  GZYProgressView.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/3/1.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYProgressView.h"

@implementation GZYProgressView

-(void)awakeFromNib{
    
    self.roundedCorners = 5;
    self.thicknessRatio = 0.2;
    self.progressLabel.textColor = [UIColor whiteColor];
    
    
}

-(void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    
    [super setProgress:progress animated:animated];
    
    NSMutableString *text = [NSMutableString stringWithFormat:@"%.0f%%",progress * 100];
    
    [text replaceOccurrencesOfString:@"-" withString:@"" options:0 range:NSMakeRange(0, text.length)];
    
    self.progressLabel.text = text;
    
}

@end
