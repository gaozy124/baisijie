//
//  GZYRecomendUser.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/12.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZYRecomendUser : NSObject

@property(nonatomic,copy)NSString *header;
@property(nonatomic,copy)NSString *screen_name;
@property(nonatomic,assign)NSInteger fans_count;


-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)userWithDic:(NSDictionary *)dic;
+(NSArray *)usersWithDicArray:(NSArray<NSDictionary *> *)array;


@end
