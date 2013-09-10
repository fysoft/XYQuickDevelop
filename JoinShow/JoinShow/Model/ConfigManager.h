//
//  ConfigManager.h
//  JoinShow
//
//  Created by Heaven on 13-9-10.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigManager : NSObject

XY_SINGLETON(ConfigManager)

@property (nonatomic, copy) NSString *StrTest;

@end
