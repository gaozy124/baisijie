//
//  GZYConstant.h
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/27.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    GZYTopicTypeAll = 1,
    GZYTopicTypeVideo = 41,
    GZYTopicTypeSound = 31,
    GZYTopicTypePicture = 10,
    GZYTopicTypeWord = 29

}GZYTopicType;

/** 标题栏高度 */
UIKIT_EXTERN CGFloat const GZYTittlesViewH;

/** 标题栏y值 */
UIKIT_EXTERN CGFloat const GZYTittlesViewY;

/** topicCell边距 */
UIKIT_EXTERN CGFloat const GZYTopicCellMargin;

/** topicCell底部栏高度 */
UIKIT_EXTERN CGFloat const GZYTopicCellBottomBarH;

/** GZYLabel单行高度 */
UIKIT_EXTERN CGFloat const GZYLabelSingleLineH;

/** 图片最大高度 */
UIKIT_EXTERN CGFloat const GZYPictureMaxH;

/** 图片标准高度 */
UIKIT_EXTERN CGFloat const GZYPictureStandardH;

/** 图片最大缓存 */
UIKIT_EXTERN NSUInteger const GZYMaxCache;

/** 图片最大缓存像素 */
UIKIT_EXTERN NSUInteger const GZYMaxMemory;