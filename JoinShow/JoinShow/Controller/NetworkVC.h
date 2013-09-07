//
//  NetworkVC.h
//  JoinShow
//
//  Created by Heaven on 13-9-7.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYNetworkEngine;
@interface NetworkVC : UIViewController
@property (nonatomic, retain) XYNetworkEngine *networkEngine;
@property (nonatomic, retain) XYNetworkEngine *networkEngine2;
- (IBAction)clickGet:(id)sender;
- (IBAction)clickPost:(id)sender;

@end
