//
//  UIAlertView+XY.h
//  JoinShow
//
//  Created by Heaven on 13-10-17.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (XY)

-(void) handlerClickedButton:(void (^)(NSInteger btnIndex))aBlock;
-(void) handlerCancel:(void (^)(void))aBlock;
-(void) handlerWillPresent:(void (^)(void))aBlock;
-(void) handlerDidPresent:(void (^)(void))aBlock;
-(void) handlerWillDismiss:(void (^)(NSInteger btnIndex))aBlock;
-(void) handlerDidDismiss:(void (^)(NSInteger btnIndex))aBlock;
-(void) handlerShouldEnableFirstOtherButton:(BOOL (^)(void))aBlock;

@end
