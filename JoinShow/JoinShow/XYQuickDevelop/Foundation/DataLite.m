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

DEF_SINGLETON(DataLite)

DEF_DataLite_object(StrTest)
/*
#pragma mark - todo 多类型判断
-(void) setStrTest:(NSString *)str{
    if (str == nil) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"StrTest"];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"StrTest"];
    }
}

 -(NSString *) StrTest{
 return  [[NSUserDefaults standardUserDefaults] stringForKey:@"StrTest"];
 }
 */
@end
