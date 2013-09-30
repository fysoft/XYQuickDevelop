//
//  UIImage+XY.h
//  JoinShow
//
//  Created by Heaven on 13-9-30.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XY)
//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect;
//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size;

@end
