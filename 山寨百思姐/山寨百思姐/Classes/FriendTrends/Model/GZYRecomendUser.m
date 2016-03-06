//
//  GZYRecomendUser.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/12.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendUser.h"

@implementation GZYRecomendUser


-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValue:dic[@"screen_name"] forKeyPath:@"screen_name"];
        [self setValue:dic[@"fans_count"] forKeyPath:@"fans_count"];
        [self setValue:dic[@"header"] forKeyPath:@"header"];
    }
    return self;
}


+(instancetype)userWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
 
}



+(NSArray *)usersWithDicArray:(NSArray<NSDictionary *> *)array{
    
    NSMutableArray *usersArray = [NSMutableArray array];
    
    for (NSDictionary *dic in array) {
        GZYRecomendUser *user = [GZYRecomendUser userWithDic:dic];
        [usersArray addObject:user];
    }
    
    return usersArray;
}







@end
