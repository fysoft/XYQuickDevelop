//
//  XYTimer.h
//  JoinShow
//
//  Created by Heaven on 13-9-8.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

// 定时器 暂时默认只有一个
#define XYTimer_default @"ddd"
#import <Foundation/Foundation.h>

@protocol XYTimerDelegate <NSObject>

@optional
-(void) onTimer:(NSTimeInterval)ti;

@end


@interface XYTimer : NSObject
XY_SINGLETON(XYTimer)
@property (nonatomic, readonly) NSMutableDictionary *timers;
@property (nonatomic, assign) id<XYTimerDelegate> delegate;
@property (nonatomic, readonly) NSTimeInterval accumulatorTime;

// 默认的定时器
-(void) startTimerWithInterval:(NSTimeInterval)ti;
-(void) stopTimer;
-(void) pauseTimer;


@end
