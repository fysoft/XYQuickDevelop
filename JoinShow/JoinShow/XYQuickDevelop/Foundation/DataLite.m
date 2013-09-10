//
//  DataLite.m
//  JoinShow
//
//  Created by Heaven on 13-9-10.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#pragma mark -to kvo

#import "DataLite.h"

@implementation DataLite
//DEF_SINGLETON(DataLite)

DEF_DataLite_object(StrTest)

#pragma mark - todo 多类型判断

+(id) readObjectForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void) writeObject:(id)aObject forKey:(NSString *)key synchronize:(BOOL)bSync{
    if (aObject == nil) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:aObject forKey:key];
    }
    if (bSync) {
        [[self class] synchronize];
    }
}
+(void) synchronize{
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
