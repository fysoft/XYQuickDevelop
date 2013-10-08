//
//  UIImage+XY.h
//  JoinShow
//
//  Created by Heaven on 13-9-30.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

    
@interface UIImage (XY)
// 压缩转换
-(UIImage *) transprent;

// 圆形
-(UIImage *)rounded;
// 变成 尺寸circleRect的圆形
-(UIImage *)rounded:(CGRect)circleRect;

// 拉伸
- (UIImage *)stretched;
- (UIImage *)stretched:(UIEdgeInsets)capInsets;

// 灰度
- (UIImage *)grayscale;

//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect;
//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size;

- (UIColor *)patternColor;

// 叠加合并
- (UIImage *)merge:(UIImage *)image;

// 圆角
typedef enum {
    UIImageRoundedCornerTopLeft = 1,
    UIImageRoundedCornerTopRight = 1 << 1,
    UIImageRoundedCornerBottomRight = 1 << 2,
    UIImageRoundedCornerBottomLeft = 1 << 3
} UIImageRoundedCorner;

- (UIImage *)roundedRectWith:(float)radius;
- (UIImage *)roundedRectWith:(float)radius cornerMask:(UIImageRoundedCorner)cornerMask;

@end
