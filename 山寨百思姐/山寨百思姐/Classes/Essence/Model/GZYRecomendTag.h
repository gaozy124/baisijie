//
//  GZYTag.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/14.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZYRecomendTag : NSObject

@property(nonatomic,copy)NSString *theme_name;
@property(nonatomic,copy)NSString *image_list;
@property(nonatomic,assign)NSInteger sub_number;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)tagWithDic:(NSDictionary *)dic;
+(NSArray *)tagsWithDicArray:(NSArray<NSDictionary *> *)array;




@end
