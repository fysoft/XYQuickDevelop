//
//  XYNetWorkEngine.h
//  JoinShow
//
//  Created by Heaven on 13-9-7.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "MKNetworkEngine.h"
@class MKNetworkEngine;
@interface NetworkEngine : MKNetworkEngine
// get
-(void) addGetRequestWithPath:(NSString *)path
                       params:(NSMutableDictionary *)params
                      succeed:(void (^)(MKNetworkOperation *operation))blockS
                       failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF;
// post
#pragma mark -todo, post
-(void) addPostRequestWithPath:(NSString *)path
                        params:(NSMutableDictionary *)params
                       succeed:(void (^)(MKNetworkOperation *operation))blockS
                        failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF;

// download
-(MKNetworkOperation *) downLoadForm:(NSString *)remoteURL toFile:(NSString*)filePath;
-(void) addDownload:(MKNetworkOperation *)op
           progress:(void(^)(double progress))blockP
            succeed:(void (^)(MKNetworkOperation *operation))blockS
             failed:(void (^)(MKNetworkOperation *errorOp, NSError* err))blockF;

// cancel
-(void) cancelOperationsContainingURLString:(NSString*)string;
@end

