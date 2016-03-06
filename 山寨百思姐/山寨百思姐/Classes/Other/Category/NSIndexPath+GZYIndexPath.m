//
//  NSIndexPath+GZYIndexPath.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/3/2.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "NSIndexPath+GZYIndexPath.h"

@implementation NSIndexPath (GZYIndexPath)


+(NSMutableArray *)indexPathsWithArray:(NSInteger)arrayCount appendArray:(NSInteger)appendArrayCount{
    
    
    NSMutableArray *indexArray = [NSMutableArray array];
    
    for (NSInteger i = arrayCount - appendArrayCount; i < arrayCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexArray addObject:indexPath];
    }
    
    
    return indexArray;
    
    
}


@end
