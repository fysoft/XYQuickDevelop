//
//  DataLite.h
//  JoinShow
//
//  Created by Heaven on 13-9-10.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

// 轻量形数据持久化, 基于NSUserDefaults

#define XY_DataLite_string( __data ) \
-(void) set##__data:(NSString *)aObject; \
-(id) __data;
// 记得在程序进入后台,退出时 [[NSUserDefaults standardUserDefaults] synchronize]

#define NSStringifyWithoutExpandingMacros(x) @#x
#define NSStringify(x) NSStringifyWithoutExpandingMacros(x)

// 注意: __data 首字母需要大写
#define DEF_DataLite_object( __data ) \
-(void) set##__data:(id)aObject{ \
if (aObject == nil) { \
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSStringify( __data )]; \
}else{ \
    [[NSUserDefaults standardUserDefaults] setObject:aObject forKey:NSStringify( __data )]; \
} \
NSLogDD; \
} \
-(id) __data{ \
    return  [[NSUserDefaults standardUserDefaults] objectForKey:NSStringify( __data )]; \
}

#import <Foundation/Foundation.h>

@interface DataLite : NSObject
XY_SINGLETON(DataLite)
XY_DataLite_string(StrTest)
/*
-(void) setStrTest:(NSString *)str;
-(id) StrTest;
 */

@end
