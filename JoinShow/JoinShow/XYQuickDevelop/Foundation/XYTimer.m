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
-(void) startTimerWithInterval:(NSTimeInterval)ti{
    NSTimer *timer = [_timers objectForKey:XYTimer_default];
    if (timer) {
        [timer setFireDate:[NSDate distantPast]];
    }else{
        _accumulatorTime = 0;
        NSDate *date = [NSDate date];
        timer = [[NSTimer alloc] initWithFireDate:date interval:ti target:self selector:@selector(runDefaultTimer:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [_timers setObject:timer forKey:XYTimer_default];
        [timer release];
    }

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
-(void) runDefaultTimer:(NSTimer *)timer{
    _accumulatorTime += timer.timeInterval;
    Delegate(onTimer:, _accumulatorTime)
}
@end
