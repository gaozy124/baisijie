//
//  GZYTopic.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/27.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYTopic.h"
#import <objc/runtime.h>

@implementation GZYTopic

@synthesize largeImage = _image1;
@synthesize ID = _id;


-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        unsigned int count;
        Ivar *ivars = class_copyIvarList([self class], &count);
        
        for (int i = 0; i<count; i++) {
            Ivar ivar = *(ivars + i);
            NSString *ivarName = [NSString stringWithFormat:@"%s",ivar_getName(ivar)+1];
            
            if (dict[ivarName]) {
                [self setValue:dict[ivarName] forKeyPath:ivarName];
                
            }
        }
        
    }
    
    
    return self;
 
    
}

+(instancetype)topicWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
    
}


+(NSMutableArray *)topicsWithDictArray:(NSArray<NSDictionary *> *)array{
    
    NSMutableArray *topics = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        GZYTopic *topic = [GZYTopic topicWithDict:dict];
        [topics addObject:topic];
    }
    
    return topics;
    }
    
    











@end
