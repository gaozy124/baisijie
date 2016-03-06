//
//  GZYRecomendCategoryTableViewCell.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/12.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendCategoryTableViewCell.h"
#import "GZYRecomendCategory.h"

@interface GZYRecomendCategoryTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *indicatorView;




@end





@implementation GZYRecomendCategoryTableViewCell

- (void)awakeFromNib {

    
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.backgroundColor = selected ? [UIColor whiteColor] : [UIColor clearColor];
    self.textLabel.textColor = selected ? GZYRGBColor(219, 21, 26) : GZYRGBColor(78, 78, 78) ;
    self.indicatorView.hidden = !selected;
    
}


-(void)setCategory:(GZYRecomendCategory *)category{
    
    _category = category;
    
    self.textLabel.text = self.category.name;
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.textLabel.size = CGSizeMake(self.width - 10, self.height);
    self.textLabel.center = self.contentView.center;
  
}




@end
