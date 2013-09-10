//
//  DataLite.h
//  JoinShow
//
//  Created by Heaven on 13-9-10.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

// 轻量形数据持久化, 基于NSUserDefaults
// 记得在程序进入后台,退出时调用 XY_DataLite_synchronize

// 同步数据到硬盘
#define XY_DataLite_synchronize [DataLite synchronize];

#define XY_DataLite_string( __data ) \
-(void) set##__data:(NSString *)aObject; \
-(id) __data;

#define NSStringifyWithoutExpandingMacros(x) @#x
#define NSStringify(x) NSStringifyWithoutExpandingMacros(x)

// 注意: __data 首字母需要大写
#define DEF_DataLite_object( __name ) \
-(void) set##__name:(id)aObject{ \
    [DataLite writeObject:aObject forKey:NSStringify( __name )]; \
} \
-(id) __name{ \
    return  [DataLite readObjectForKey:NSStringify( __name )]; \
}

#import <Foundation/Foundation.h>

@interface DataLite : NSObject
//XY_SINGLETON(DataLite)
XY_DataLite_string(StrTest)

+(id) readObjectForKey:(NSString *)key;

+(void) writeObject:(id)aObject forKey:(NSString *)key; // default synchronize:NO
+(void) writeObject:(id)aObject forKey:(NSString *)key synchronize:(BOOL)bSync;

+(void) synchronize;
@end
