//
//  XYTimer.m
//  JoinShow
//
//  Created by Heaven on 13-9-8.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "XYTimer.h"

@implementation XYTimer
DEF_SINGLETON(XYTimer)

- (id)init
{
    self = [super init];
    if (self) {
        _timers = [[NSMutableDictionary alloc] initWithCapacity:2];
    }
    return self;
}

- (void)dealloc
{
    [_timers release];
    [super dealloc];
}
- (void)setDelegate:(id)iDelegate
{
    _delegate = iDelegate;
    //classIsa = (int)object_getClass(_delegate);
}
-(void) startTimerWithInterval:(NSTimeInterval)ti{
    NSTimer *timer = [_timers objectForKey:XYTimer_default];
    if (timer) {
        float f = _accumulatorTime;
        [self stopTimer];
        _accumulatorTime = f;
    }else{
        _accumulatorTime = 0;
    }
    
    NSDate *date = [NSDate date];
    timer = [[NSTimer alloc] initWithFireDate:date interval:ti target:self selector:@selector(runDefaultTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [_timers setObject:timer forKey:XYTimer_default];
    [timer release];
}
-(void) stopTimer{
    NSTimer *timer = [_timers objectForKey:XYTimer_default];
    if (timer) {
        [timer invalidate];
        [_timers removeObjectForKey:XYTimer_default];
        timer = nil;
        _accumulatorTime = 0;
    }
}
-(void) pauseTimer{
    NSTimer *timer = [_timers objectForKey:XYTimer_default];
    if (timer) {
        [timer setFireDate:[NSDate distantFuture]];
    }
}
-(void) resumeTimer{
    NSTimer *timer = [_timers objectForKey:XYTimer_default];
    if (timer) {
        [timer setFireDate:[NSDate date]];
    }
    
}
-(void) runDefaultTimer:(NSTimer *)timer{
    _accumulatorTime += timer.timeInterval;
    NSLogD(@"%f", _accumulatorTime);
    Delegate(onTimer:, _accumulatorTime)
}
@end
