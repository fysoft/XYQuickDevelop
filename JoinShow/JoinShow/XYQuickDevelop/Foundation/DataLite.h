//
//  DataLite.h
//  JoinShow
//
//  Created by Heaven on 13-9-10.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

// 轻量形数据持久化, 基于NSUserDefaults
// 如果最后用的是DEF_DataLite_object, 记得在程序进入后台,退出时调用 XY_DataLite_synchronize


#define NSStringifyWithoutExpandingMacros(x) @#x
#define NSStringify(x) NSStringifyWithoutExpandingMacros(x)

// 同步数据到硬盘
#define XY_DataLite_synchronize [DataLite synchronize];

// 注意: __name 首字母需要大写
#define XY_DataLite_string( __name ) \
-(void) set##__name:(NSString *)anObject; \
-(id) __name;

#define XY_DataLite_object( __name ) \
-(void) set##__name:(id)anObject; \
-(id) __name;

/*
#define DEF_setMethod( __name, __synchronize) \
-(void) set##__name:(id)anObject{ \
[DataLite writeObject:anObject forKey:NSStringify( __name ) synchronize:__synchronize]; \
}
*/
// __synchronize 自动存
// 注意:__defaultObject不要使用bool
// 用__defaultPath时不要用NSNumber, NSString NSData 识别问题
// 2个只能用一个
#define DEF_DataLite_object( __name , __synchronize, __defaultObject, __defaultPath) \
-(void) set##__name:(id)anObject{ \
[DataLite writeObject:anObject forKey:NSStringify( __name ) synchronize:__synchronize]; \
} \
-(id) __name{ \
    return [DataLite readObjectForKey:NSStringify( __name ) defaultObject:__defaultObject defaultObjectPath:__defaultPath]; \
}

#import "XYPrecompile.h"
#import "XYFoundation.h"

@interface DataLite : NSObject
//XY_SINGLETON(DataLite)
XY_DataLite_string(StrTest)

// dont support bool
+(id) readObjectForKey:(NSString *)key;
// defaultObject dont support bool, defaultObjectPath dont support NSNumber
+(id) readObjectForKey:(NSString *)key defaultObject:(id)defaultObject defaultObjectPath:(NSString *)aPath;

// dont support bool
//+(id) readObjectForKey:(NSString *)key defaultObject:(id)defaultObject;
//+(id) readObjectForKey:(NSString *)key defaultObjectPath:(NSString *)aPath;



// if bSync == YES, run [[NSUserDefaults standardUserDefaults] synchronize]
+(void) writeObject:(id)anObject forKey:(NSString *)key synchronize:(BOOL)bSync;

+(void) synchronize;
@end
