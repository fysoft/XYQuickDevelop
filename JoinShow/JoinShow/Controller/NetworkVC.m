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
                _networkEngine = [[NetworkEngine alloc] initWithHostName:@"www.webxml.com.cn/" customHeaderFields:nil];
        [_networkEngine useCache];
        
        _networkEngine3 = [[NetworkEngine alloc] initWithHostName:@"www.webxml.com.cn/" customHeaderFields:nil];
        [_networkEngine3 useCache];
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
    self.networkEngine3 = nil;
    [_progressDownload release];
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

- (IBAction)clickDownload:(id)sender {
    NSString *locPath = [Common dataFilePath:@"DownloadedFile.pdf" ofType:filePathOption_documents];
    
     id down = [self.networkEngine3 downLoadForm:@"http://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURLRequest_Class/NSURLRequest_Class.pdf" toFile:locPath];
    
    [self.networkEngine3 addDownload:down progress:^(double progress) {
        NSLogD(@"%.2f", progress*100.0);
        _progressDownload.progress = progress;
    } succeed:^(MKNetworkOperation *operation) {
        _progressDownload.progress = 0;
        SHOWMSG(nil, @"Download succeed", @"ok");
    } failed:^(MKNetworkOperation *errorOp, NSError *err) {
         NSLog(@"MKNetwork request error : %@", [err localizedDescription]);
        SHOWMSG(nil, @"Download failed", nil);
    }];
    
    
}
@end