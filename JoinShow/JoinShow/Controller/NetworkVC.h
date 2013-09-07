//
//  NetworkVC.h
//  JoinShow
//
//  Created by Heaven on 13-9-7.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkVC : UIViewController
@property (nonatomic, retain) XYNetworkEngine *networkEngine;
- (IBAction)clickGet:(id)sender;
- (IBAction)clickPost:(id)sender;

@end
