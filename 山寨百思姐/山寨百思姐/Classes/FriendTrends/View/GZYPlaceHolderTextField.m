//
//  GZYPlaceHolderTextField.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/20.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYPlaceHolderTextField.h"
#import <objc/runtime.h>

@interface GZYPlaceHolderTextField()




@end



@implementation GZYPlaceHolderTextField

+(void)initialize{
    
    unsigned int count;
    
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    
    for (int i=0; i<count; i++) {
        
        Ivar ivar = *(ivars+i);
        
        NSLog(@"%s",ivar_getName(ivar));
    }
    
    free(ivars);
}

-(void)awakeFromNib{
    

    
    self.textColor = [UIColor whiteColor];

    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder attributes:@{
//                                                                                                                        NSFontAttributeName:[UIFont systemFontOfSize:15],
//                                                                                                                        NSForegroundColorAttributeName:[UIColor lightGrayColor]
//                                                                                                                        }];
//    self.attributedPlaceholder = string;
    
    [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
}

-(BOOL)becomeFirstResponder{
    [super becomeFirstResponder];
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder attributes:@{
//                                                                                                                        NSFontAttributeName:[UIFont systemFontOfSize:15],
//                                                                                                                        NSForegroundColorAttributeName:[UIColor whiteColor]
//                                                                                                                        }];
//    self.attributedPlaceholder = string;
    
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    return YES;
    
}

-(BOOL)resignFirstResponder{
    [super resignFirstResponder];
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder attributes:@{
//                                                                                                                        NSFontAttributeName:[UIFont systemFontOfSize:15],
//                                                                                                                        NSForegroundColorAttributeName:[UIColor lightGrayColor]
//                                                                                                                        }];
//    self.attributedPlaceholder = string;
    
    [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    return YES;
}





@end
