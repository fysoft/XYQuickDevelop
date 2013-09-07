//
//  NetworkEngineBase.h
//  JoinShow
//
//  Created by Heaven on 13-9-7.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface XYNetworkEngine : MKNetworkEngine

-(void) addGetRequestWithPath:(NSString *)path
                       params:(NSMutableDictionary *)params
                      succeed:(void (^)(MKNetworkOperation *operation))blockS
                       failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF;

#pragma mark post待完善
-(void) addPostRequestWithPath:(NSString *)path
                       params:(NSMutableDictionary *)params
                      succeed:(void (^)(MKNetworkOperation *operation))blockS
                       failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF;

@end
