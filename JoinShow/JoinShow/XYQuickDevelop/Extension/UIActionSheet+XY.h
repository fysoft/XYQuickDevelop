//
//  UIActionSheet+XY.h
//  JoinShow
//
//  Created by Heaven on 13-10-17.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "XYPrecompile.h"

@interface UIActionSheet (XY)

-(void) handlerClickedButton:(void (^)(NSInteger btnIndex))aBlock;
-(void) handlerCancel:(void (^)(void))aBlock;
-(void) handlerWillPresent:(void (^)(void))aBlock;
-(void) handlerDidPresent:(void (^)(void))aBlock;
-(void) handlerWillDismiss:(void (^)(void))aBlock;
-(void) handlerDidDismiss:(void (^)(NSInteger btnIndex))aBlock;

@end
