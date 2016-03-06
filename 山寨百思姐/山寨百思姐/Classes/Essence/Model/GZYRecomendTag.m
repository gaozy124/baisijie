//
//  GZYTag.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/14.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendTag.h"

@implementation GZYRecomendTag

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValue:dic[@"theme_name"] forKey:@"theme_name"];
        [self setValue:dic[@"image_list"] forKey:@"image_list"];
        [self setValue:dic[@"sub_number"] forKey:@"sub_number"];
    }
    return self;
    
}
+(instancetype)tagWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
    
    
}
+(NSArray *)tagsWithDicArray:(NSArray<NSDictionary *> *)array{
    
    NSMutableArray *tags = [NSMutableArray array];
    
    for (NSDictionary *dic in array) {
        GZYRecomendTag *tag = [GZYRecomendTag tagWithDic:dic];
        [tags addObject:tag];
    }
    
    return tags;
    
    
}



@end
