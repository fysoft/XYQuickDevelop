//
//  DataLiteVC.m
//  JoinShow
//
//  Created by Heaven on 13-9-10.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "DataLiteVC.h"

@interface DataLiteVC ()

@end

@implementation DataLiteVC

DEF_DataLite_object(DataLiteTitle)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 320, 300)];
    tempLabel.text = @"Please read code in [DataLiteVC.m]";
    [self.view addSubview:tempLabel];
    [tempLabel release];
    
    self.DataLiteTitle = nil;
    NSLogD(@"%@", self.DataLiteTitle);
    self.DataLiteTitle = @"test1";
    NSLogD(@"%@", self.DataLiteTitle);
    
    XY_DataLite_synchronize
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
