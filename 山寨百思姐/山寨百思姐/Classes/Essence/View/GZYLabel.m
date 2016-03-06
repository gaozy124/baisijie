//
//  GZYLabel.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/28.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYLabel.h"
#import <objc/runtime.h>

@implementation GZYLabel



-(void)setText:(NSString *)text{
    
    

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{
                                                                                                               NSParagraphStyleAttributeName:paragraphStyle
                                                                                                               }];
    self.attributedText = attString;


    

}




@end

