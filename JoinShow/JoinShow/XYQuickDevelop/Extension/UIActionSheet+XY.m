//
//  UIActionSheet+XY.m
//  JoinShow
//
//  Created by Heaven on 13-10-17.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#undef	UIActionSheet_key_clickedBlock
#define UIActionSheet_key_clickedBlock	"UIActionSheet.clickedBlock"
#undef	UIActionSheet_key_cancel
#define UIActionSheet_key_cancel	"UIActionSheet.cancel"

#import "UIActionSheet+XY.h"

@implementation UIActionSheet (XY)
-(void) clickedHandler:(void (^)(NSInteger btnIndex))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_clickedBlock, aBlock, OBJC_ASSOCIATION_COPY);
}
-(void) cancelHandler:(void (^)(void))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_cancel, aBlock, OBJC_ASSOCIATION_COPY);
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger btnIndex) = objc_getAssociatedObject(self, UIActionSheet_key_clickedBlock);
    
    if (block) block(buttonIndex);
}
- (void)actionSheetCancel:(UIAlertView *)alertView{
    void (^block)(void) = objc_getAssociatedObject(self, UIActionSheet_key_cancel);
    
    if (block) block();
}
@end
