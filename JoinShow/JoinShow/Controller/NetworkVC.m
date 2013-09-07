//
//  NetworkVC.m
//  JoinShow
//
//  Created by Heaven on 13-9-7.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "NetworkVC.h"

@interface NetworkVC ()

@end

@implementation NetworkVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
                _networkEngine = [[XYNetworkEngine alloc] initWithHostName:@"www.webxml.com.cn/" customHeaderFields:nil];
        [_networkEngine useCache];
    }
    return  self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)dealloc
{
    NSLogDD;
    self.networkEngine = nil;
    self.networkEngine2 = nil;
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickGet:(id)sender {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"theCityName": @"深圳"}];
    
    [self.networkEngine
     addGetRequestWithPath:@"WeatherWebservice.asmx/getWeatherbyCityName"
     params:dic
     succeed:^(MKNetworkOperation *operation) {
         if([operation isCachedResponse]) {
             NSLog(@"Data from cache %@", @"a");
         }
         else {
             NSLog(@"Data from server %@", @"a");
         }
     }
     failed:^(MKNetworkOperation *errorOp, NSError *err) {
         NSLog(@"MKNetwork request error : %@", [err localizedDescription]);
     }];
}

- (IBAction)clickPost:(id)sender {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"theCityName": @"深圳"}];
    
    [self.networkEngine
     addPostRequestWithPath:@"WeatherWebservice.asmx/getWeatherbyCityName"
     params:dic
     succeed:^(MKNetworkOperation *operation) {
         if([operation isCachedResponse]) {
             NSLog(@"Data from cache %@", @"a");
         }
         else {
             NSLog(@"Data from server %@", @"a");
         }
     }
     failed:^(MKNetworkOperation *errorOp, NSError *err) {
         NSLog(@"MKNetwork request error : %@", [err localizedDescription]);
     }];
}
@end
