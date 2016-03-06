//
//  GZYRecomendUserTableViewCell.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/12.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendUserTableViewCell.h"
#import "GZYRecomendUser.h"
#import <UIImageView+WebCache.h>



@interface GZYRecomendUserTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *followLabel;



@end


@implementation GZYRecomendUserTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUser:(GZYRecomendUser *)user{
    
    _user = user;
    
    self.nameLabel.text = user.screen_name;
    
    if (user.fans_count < 10000) {
        
        self.followLabel.text = [NSString stringWithFormat:@"%zd人关注他",user.fans_count];
        
    }else{
        
        self.followLabel.text = [NSString stringWithFormat:@"%.1f万人关注他",user.fans_count/10000.0];
    }
    
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    
    
    
}

@end
