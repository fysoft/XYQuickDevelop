//
//  ParallaxVC.m
//  JoinShow
//
//  Created by Heaven on 13-10-9.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "ParallaxVC.h"
#import "XYCommon.h"


@interface ParallaxVC ()

@end

@implementation ParallaxVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)dealloc
{
     [[ParallaxManager sharedInstance] stop];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    tempLabel.text = @"test1";
    tempLabel.textColor = [UIColor whiteColor];
    tempLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tempLabel];
    [[ParallaxManager sharedInstance] setView:tempLabel intensity:10];
    [tempLabel release];
    
    tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 100, 30)];
    tempLabel.text = @"test2";
    tempLabel.textColor = [UIColor whiteColor];
    tempLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tempLabel];
    [[ParallaxManager sharedInstance] setView:tempLabel intensity:20];
    [tempLabel release];
    
    tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    tempLabel.text = @"test3";
    tempLabel.textColor = [UIColor whiteColor];
    tempLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tempLabel];
    [[ParallaxManager sharedInstance] setView:tempLabel intensity:30];
    [tempLabel release];
    
    tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 100, 30)];
    tempLabel.text = @"test4";
    tempLabel.textColor = [UIColor whiteColor];
    tempLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tempLabel];
    [[ParallaxManager sharedInstance] setView:tempLabel intensity:40];
    [tempLabel release];
    
    [self.view setBg:@"bg.jpg"];
    [[ParallaxManager sharedInstance] setView:self.view intensity:-10];
    
    [[ParallaxManager sharedInstance] start]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 设备方向改变
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [[ParallaxManager sharedInstance] resetDeviceOrientation];
}
@end
