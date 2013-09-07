//
//  NetworkEngineBase.m
//  JoinShow
//
//  Created by Heaven on 13-9-7.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "XYNetworkEngine.h"
#if (1 ==  __USED_MKNetworkKit__)
@implementation XYNetworkEngine

-(void) addGetRequestWithPath:(NSString *)path
                       params:(NSMutableDictionary *)params
                      succeed:(void (^)(MKNetworkOperation *operation))blockS
                       failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF{
    
    MKNetworkOperation *op = [self operationWithPath:path params:params httpMethod:@"GET" ssl:NO];
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        if (blockS) blockS(operation);
    }errorHandler:^(MKNetworkOperation *errorOp, NSError *err) {
        if (blockF) blockF(errorOp, err);
    }];
    // 先读缓存,然后发请求,blockS响应2次
    [self enqueueOperation:op forceReload:YES];
}

-(void) addPostRequestWithPath:(NSString *)path
                       params:(NSMutableDictionary *)params
                      succeed:(void (^)(MKNetworkOperation *operation))blockS
                       failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF{
    
    MKNetworkOperation *op = [self operationWithPath:path params:params httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        if (blockS) blockS(operation);
    }errorHandler:^(MKNetworkOperation *errorOp, NSError *err) {
        if (blockF) blockF(errorOp, err);
    }];
    [self enqueueOperation:op];
}

@end
#endif
