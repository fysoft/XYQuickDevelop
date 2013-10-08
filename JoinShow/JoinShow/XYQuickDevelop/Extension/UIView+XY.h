//
//  UIView+XY.h
//  TWP_SkyBookShelf
//
//  Created by Heaven on 13-7-31.
//
//

#define UIView_shadeTag 26601

#import <UIKit/UIKit.h>

@interface UIView (XY)

// 增加手势
-(void) addTapGestureWithTarget:(id)target action:(SEL)action;
-(void) addTapGestureWithBlock:(void(^)(void))aBlock;

-(void) removeTapGesture;

// 增加背景阴影
-(void) addShadeWithTarget:(id)target action:(SEL)action color:(UIColor *)aColor alpha:(float)aAlpha;
-(void) removeShade;

// 设置背景
-(void) setBg:(NSString *)str;
@end
