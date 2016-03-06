//
//  Catagory.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/12.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZYRecomendCategory : NSObject

@property(nonatomic,assign)NSInteger id;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *users;
@property(nonatomic,assign)NSInteger total;
@property(nonatomic,assign)NSInteger currentPage;


+(instancetype)categoryWithDic:(NSDictionary *)dic;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(NSArray *)categorysWithDicArray:(NSArray<NSDictionary *> *)array;


@end
