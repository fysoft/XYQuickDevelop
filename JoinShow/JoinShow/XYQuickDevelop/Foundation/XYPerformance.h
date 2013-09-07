//
//  XYPerformance.h
//  JoinShow
//
//  Created by Heaven on 13-8-23.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//  Copy from bee Framework

// 性能分析
#import <Foundation/Foundation.h>
#import "CommonDefine.h"
#pragma mark -

#if (1 ==  __XY_PERFORMANCE__)

#define PERF_TAG( __X )		[NSString stringWithFormat:@"%s %s", __X]
#define PERF_TAG1( __X )	[NSString stringWithFormat:@"enter %s %s", __X]
#define PERF_TAG2( __X )	[NSString stringWithFormat:@"leave %s %s", __X]

#define	PERF_MARK( __X ) \
[XYPerformance markTag:PERF_TAG(#__X)];

#define	PERF_TIME( __X1, __X2 ) \
[XYPerformance betweenTag:PERF_TAG(#__X1) andTag:PERF_TAG(#__X2)]

#define PERF_ENTER \
[XYPerformance markTag:PERF_TAG1("")];

#define PERF_ENTER_( __X ) \
[XYPerformance markTag:PERF_TAG1(#__X)];

#define PERF_LEAVE \
[XYPerformance markTag:PERF_TAG2("")]; \
[XYPerformance recordName:PERF_TAG("") andTime:[XYPerformance betweenTag:PERF_TAG1("") andTag:PERF_TAG2("")]];

#define PERF_LEAVE_( __X ) \
[XYPerformance markTag:PERF_TAG2(#__X)]; \
[XYPerformance recordName:PERF_TAG(#__X) andTime:[XYPerformance betweenTag:PERF_TAG1(#__X) andTag:PERF_TAG2(#__X)]];

#else	// #if (1 ==  __XY_PERFORMANCE__)

#define	PERF_MARK( __TAG )
#define	PERF_TIME( __TAG1, __TAG2 )	(0.0f)

#define PERF_ENTER
#define PERF_LEAVE

#define PERF_ENTER_( __X )
#define PERF_LEAVE_( __X )

#endif	// #if (1 ==  __XY_PERFORMANCE__)

#pragma mark -

@interface XYPerformance : NSObject

XY_SINGLETON( XYPerformance );

@property (nonatomic, readonly) NSMutableDictionary *	records;
@property (nonatomic, retain) NSMutableDictionary *		tags;

+ (double)timestamp;

+ (double)markTag:(NSString *)tag;
+ (double)betweenTag:(NSString *)tag1 andTag:(NSString *)tag2;
+ (double)betweenTag:(NSString *)tag1 andTag:(NSString *)tag2 shouldRemove:(BOOL)remove;

+ (void)watchClass:(Class)clazz;
+ (void)watchClass:(Class)clazz andSelector:(SEL)selector;

+ (void)recordName:(NSString *)name andTime:(NSTimeInterval)time;

@end
