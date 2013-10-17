//
//  MessVC.m
//  JoinShow
//
//  Created by Heaven on 13-9-1.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "MessVC.h"

@interface MessVC ()

@end

@implementation MessVC

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBtnShade:(id)sender {
    [self.view addShadeWithTarget:self action:@selector(closeShade) color:nil alpha:0.7];
}

- (IBAction)clickBtnBlockAlertView:(id)sender {
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"title" message:@"msg" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil] autorelease];
    [alertView handlerClickedButton:^(NSInteger btnIndex) {
        NSLogD(@"%d", btnIndex);
    }];
    [alertView show];
}

- (IBAction)clickBtnBlockActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] initWithTitle:@"title" delegate:nil cancelButtonTitle:@"cancel" destructiveButtonTitle:@"destructive" otherButtonTitles:@"other1", @"other2", nil] autorelease];
    [actionSheet handlerClickedButton:^(NSInteger btnIndex) {
        NSLogD(@"%d", btnIndex);
    }];
    [actionSheet showInView:self.view];
}
-(void) closeShade{
    [self.view removeShade];
}
@end
