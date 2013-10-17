//
//  UIAlertView+XY.m
//  JoinShow
//
//  Created by Heaven on 13-10-17.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#undef	UIAlertView_key_clickedBlock
#define UIAlertView_key_clickedBlock	"UIAlertView.clickedBlock"
#undef	UIAlertView_key_cancel
#define UIAlertView_key_cancel	"UIAlertView.cancel"

#import "UIAlertView+XY.h"

@implementation UIAlertView (XY)

-(void) clickedHandler:(void (^)(NSInteger btnIndex))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_clickedBlock, aBlock, OBJC_ASSOCIATION_COPY);
}
-(void) cancelHandler:(void (^)(void))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_cancel, aBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark - UIAlertViewDelegate
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger btnIndex) = objc_getAssociatedObject(self, UIAlertView_key_clickedBlock);
    
    if (block) block(buttonIndex);
}
- (void)alertViewCancel:(UIAlertView *)alertView{
    void (^block)(void) = objc_getAssociatedObject(self, UIAlertView_key_cancel);
    
    if (block) block();
}
@end
