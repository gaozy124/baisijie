//
//  GZYLoginButton.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/20.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYLoginButton.h"

@implementation GZYLoginButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
        
    }
    
    
    return self;
    
}

-(void)awakeFromNib{
    
    [self setup];
   
}

-(void)setup{
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.width, self.width);
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.height-self.titleLabel.height;
    self.titleLabel.width = self.width;

    
}





@end
