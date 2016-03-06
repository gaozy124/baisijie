//
//  Catagory.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/12.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYRecomendCategory.h"

@implementation GZYRecomendCategory



-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        
    }
    
    return self;
   
}

+(instancetype)categoryWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];

}

+(NSMutableArray *)categorysWithDicArray:(NSArray<NSDictionary *> *)array{
    
    NSMutableArray *categoryArray = [NSMutableArray array];
    
    for (NSDictionary *dic in array) {
        
        
        GZYRecomendCategory *category = [GZYRecomendCategory categoryWithDic:dic];
        
        [categoryArray addObject:category];
        
        
        
    }
    
    return categoryArray;
    
    
}

-(NSMutableArray *)users{
    
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}



@end
