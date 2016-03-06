//
//  GZYTopic.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/27.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZYTopic : NSObject

@property(nonatomic,assign)NSInteger cache_version;
@property(nonatomic,assign)BOOL is_gif;
@property(nonatomic,assign)NSInteger voicetime;
@property(nonatomic,assign)NSInteger voicelength;
@property(nonatomic,assign)NSInteger playfcount;
@property(nonatomic,assign)NSInteger repost;
@property(nonatomic,assign)NSInteger theme_type;
@property(nonatomic,assign)NSInteger hate;
@property(nonatomic,assign)NSInteger comment;
@property(nonatomic,assign)NSInteger ding;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,assign)NSInteger playcount;
@property(nonatomic,assign)NSInteger favourite;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,assign)NSInteger status;
@property(nonatomic,assign)NSInteger videotime;
@property(nonatomic,assign)NSInteger bookmark;
@property(nonatomic,assign)NSInteger cai;
@property(nonatomic,assign)NSInteger love;
@property(nonatomic,assign)NSInteger original_pid;
@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)BOOL sina_v;

@property(nonatomic,copy)NSString *created_at;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *image2;
@property(nonatomic,copy)NSString *bimageuri;
@property(nonatomic,copy)NSString *largeImage;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *image0;
@property(nonatomic,copy)NSString *passtime;
@property(nonatomic,copy)NSString *tag;
@property(nonatomic,copy)NSString *cdn_img;
@property(nonatomic,copy)NSString *theme_name;
@property(nonatomic,copy)NSString *create_time;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *screen_name;
@property(nonatomic,copy)NSString *profile_image;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *theme_id;
@property(nonatomic,copy)NSString *t;
@property(nonatomic,copy)NSString *image_small;
@property(nonatomic,copy)NSString *weixin_url;
@property(nonatomic,copy)NSString *voiceuri;

@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect pictureFrame;
@property(nonatomic,assign)CGRect voiceFrame;
@property(nonatomic,assign)CGRect videoFrame;
@property(nonatomic,assign,getter=isBigPicture)BOOL bigPicture;
@property(nonatomic,assign)CGFloat progress;




-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)topicWithDict:(NSDictionary *)dict;


+(NSMutableArray *)topicsWithDictArray:(NSArray<NSDictionary *> *)array;





@end
