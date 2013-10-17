//
//  UIAlertView+XY.h
//  JoinShow
//
//  Created by Heaven on 13-10-17.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (XY)

-(void) clickedHandler:(void (^)(NSInteger btnIndex))block;
-(void) cancelHandler:(void (^)(void))aBlock;

@end
