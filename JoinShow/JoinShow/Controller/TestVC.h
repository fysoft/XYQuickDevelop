//
//  TestVC.h
//  JoinShow
//
//  Created by Heaven on 13-9-1.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

// 此页面 测试用

#import "XYCommon.h"

@interface TestVC : UIViewController <XYTimerDelegate>{
    int offset;
}
@property (nonatomic, retain) NSMutableArray *array;
- (IBAction)clickBtn1:(id)sender;
- (IBAction)clickBtn2:(id)sender;
- (IBAction)clickAVSpeech:(id)sender;
- (IBAction)clickOnce:(id)sender;

@end
