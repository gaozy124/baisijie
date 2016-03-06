//
//  GZYRecomendTagCell.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/14.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendTagCell.h"
#import "GZYRecomendTag.h"
#import <UIImageView+WebCache.h>

@interface GZYRecomendTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;




@end



@implementation GZYRecomendTagCell

-(void)setFrame:(CGRect)frame{
    
    frame.origin.x = 10;
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -= 1;
    [super setFrame:frame];
    
    
}

-(void)setRecomendTag:(GZYRecomendTag *)recomendTag{
    
    _recomendTag = recomendTag;
    
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:recomendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.nameLabel.text = recomendTag.theme_name;
    
    if (recomendTag.sub_number < 10000) {
        
        self.fansLabel.text = [NSString stringWithFormat:@"%zd人订阅",recomendTag.sub_number];
        
    }else{
        
        self.fansLabel.text = [NSString stringWithFormat:@"%.1f万人订阅",recomendTag.sub_number/10000.0];
    }
   
}



@end
