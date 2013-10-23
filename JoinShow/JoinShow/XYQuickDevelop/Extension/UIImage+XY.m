//
//  UIImage+XY.m
//  JoinShow
//
//  Created by Heaven on 13-9-30.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//


#import "UIImage+XY.h"
#import "XYPrecompile.h"

DUMMY_CLASS(UIImage_XY);

//UIKit坐标系统原点在左上角，y方向向下的（坐标系A），但在Quartz中坐标系原点在左下角，y方向向上的(坐标系B)。图片绘制也是颠倒的。
static void addRoundedRectToPath(CGContextRef context, CGRect rect, float radius, UIImageRoundedCorner cornerMask)
{
    //原点在左下方，y方向向上。移动到线条2的起点。
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y + radius);
    
    //画出线条2, 目前画线的起始点已经移动到线条2的结束地方了。
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height - radius);
    
    //如果左上角需要画圆角，画出一个弧线出来。
    if (cornerMask & UIImageRoundedCornerTopLeft) {
        
        //已左上的正方形的右下脚为圆心，半径为radius， 180度到90度画一个弧线，
        CGContextAddArc(context, rect.origin.x + radius, rect.origin.y + rect.size.height - radius,
                        radius, M_PI, M_PI / 2, 1);
    }
    
    else {
        //如果不需要画左上角的弧度。从线2终点，画到线3的终点，
        CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height);
        
        //线3终点，画到线4的起点
        CGContextAddLineToPoint(context, rect.origin.x + radius, rect.origin.y + rect.size.height);
    }
    
    //画线4的起始，到线4的终点
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width - radius,
                            rect.origin.y + rect.size.height);
    
    //画右上角
    if (cornerMask & UIImageRoundedCornerTopRight) {
        CGContextAddArc(context, rect.origin.x + rect.size.width - radius,
                        rect.origin.y + rect.size.height - radius, radius, M_PI / 2, 0.0f, 1);
    }
    else {
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height - radius);
    }
    
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + radius);
    
    //画右下角弧线
    if (cornerMask & UIImageRoundedCornerBottomRight) {
        CGContextAddArc(context, rect.origin.x + rect.size.width - radius, rect.origin.y + radius,
                        radius, 0.0f, -M_PI / 2, 1);
    }
    else {
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width - radius, rect.origin.y);
    }
    
    CGContextAddLineToPoint(context, rect.origin.x + radius, rect.origin.y);
    
    //画左下角弧线
    if (cornerMask & UIImageRoundedCornerBottomLeft) {
        CGContextAddArc(context, rect.origin.x + radius, rect.origin.y + radius, radius,
                        -M_PI / 2, M_PI, 1);
    }
    else {
        CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + radius);
    }
    
    CGContextClosePath(context);
}

@implementation UIImage (XY)

//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

//等比例缩放
-(UIImage *) scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
// 压缩转换
-(UIImage *) transprent
{
	CGImageAlphaInfo alpha = CGImageGetAlphaInfo( self.CGImage );
	
	if ( kCGImageAlphaFirst == alpha ||
		kCGImageAlphaLast == alpha ||
		kCGImageAlphaPremultipliedFirst == alpha ||
		kCGImageAlphaPremultipliedLast == alpha )
	{
		return self;
	}
    
	CGImageRef	imageRef = self.CGImage;
	size_t		width = CGImageGetWidth(imageRef);
	size_t		height = CGImageGetHeight(imageRef);
    
	CGContextRef context = CGBitmapContextCreate( NULL, width, height, 8, 0, CGImageGetColorSpace(imageRef), kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedFirst);
	CGContextDrawImage( context, CGRectMake(0, 0, width, height), imageRef );
    
	CGImageRef	resultRef = CGBitmapContextCreateImage( context );
	UIImage *	result = [UIImage imageWithCGImage:resultRef];
    
	CGContextRelease( context );
	CGImageRelease( resultRef );
    
	return result;
}

- (void)addCircleRectToPath:(CGRect)rect context:(CGContextRef)context
{
    CGContextSaveGState( context );
    CGContextTranslateCTM( context, CGRectGetMinX(rect), CGRectGetMinY(rect) );
	CGContextSetShouldAntialias( context, true );
	CGContextSetAllowsAntialiasing( context, true );
	CGContextAddEllipseInRect( context, rect );
    CGContextClosePath( context );
    CGContextRestoreGState( context );
}
- (UIImage *)rounded
{
    UIImage * image = [self transprent];
	if ( nil == image )
		return nil;
	
	CGSize imageSize = image.size;
	imageSize.width = floorf( imageSize.width );
	imageSize.height = floorf( imageSize.height );
	
	CGFloat imageWidth = fminf(imageSize.width, imageSize.height);
	CGFloat imageHeight = imageWidth;
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate( NULL,
												 imageWidth,
												 imageHeight,
												 CGImageGetBitsPerComponent(image.CGImage),
												 imageWidth * 4,
												 colorSpace,
												 kCGImageAlphaPremultipliedLast );
    
    CGContextBeginPath(context);
	CGRect circleRect;
	circleRect.origin.x = 0;
	circleRect.origin.y = 0;
	circleRect.size.width = imageWidth;
	circleRect.size.height = imageHeight;
    [self addCircleRectToPath:circleRect context:context];
    CGContextClosePath(context);
    CGContextClip(context);
	
	CGRect drawRect;
	drawRect.origin.x = 0;
	drawRect.origin.y = 0;
	drawRect.size.width = imageWidth;
	drawRect.size.height = imageHeight;
    CGContextDrawImage(context, drawRect, image.CGImage);
    
    CGImageRef clippedImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
	CGColorSpaceRelease( colorSpace );
	
    UIImage * roundedImage = [UIImage imageWithCGImage:clippedImage];
    CGImageRelease(clippedImage);
	
    return roundedImage;
}

- (UIImage *)rounded:(CGRect)circleRect
{
    UIImage * image = [self transprent];
	if ( nil == image )
		return nil;
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate( NULL,
												 circleRect.size.width,
												 circleRect.size.height,
												 CGImageGetBitsPerComponent( image.CGImage ),
												 circleRect.size.width * 4,
												 colorSpace,
												 kCGImageAlphaPremultipliedLast );
	
    CGContextBeginPath(context);
    [self addCircleRectToPath:circleRect context:context];
    CGContextClosePath(context);
    CGContextClip(context);
	
	CGRect drawRect;
	drawRect.origin.x = 0; //(imageSize.width - imageWidth) / 2.0f;
	drawRect.origin.y = 0; //(imageSize.height - imageHeight) / 2.0f;
	drawRect.size.width = circleRect.size.width;
	drawRect.size.height = circleRect.size.height;
    CGContextDrawImage(context, drawRect, image.CGImage);
	
    CGImageRef clippedImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
	CGColorSpaceRelease(colorSpace);
	
    UIImage * roundedImage = [UIImage imageWithCGImage:clippedImage];
    CGImageRelease(clippedImage);
    
    return roundedImage;
}
- (UIImage *)stretched
{
	CGFloat leftCap = floorf(self.size.width / 2.0f);
	CGFloat topCap = floorf(self.size.height / 2.0f);
	return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

- (UIImage *)stretched:(UIEdgeInsets)capInsets
{
    return [self resizableImageWithCapInsets:capInsets];
}

- (UIImage *)grayscale
{
	CGSize size = self.size;
	CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGContextRef context = CGBitmapContextCreate(nil, size.width, size.height, 8, 0, colorSpace, kCGImageAlphaNone);
	CGColorSpaceRelease(colorSpace);
	
	CGContextDrawImage(context, rect, [self CGImage]);
	CGImageRef grayscale = CGBitmapContextCreateImage(context);
	CGContextRelease(context);
	
	UIImage * image = [UIImage imageWithCGImage:grayscale];
	CFRelease(grayscale);
	
	return image;
}

- (UIColor *)patternColor
{
	return [UIColor colorWithPatternImage:self];
}
- (UIImage *)merge:(UIImage *)image
{
	CGSize canvasSize;
	canvasSize.width = fmaxf( self.size.width, image.size.width );
	canvasSize.height = fmaxf( self.size.height, image.size.height );
	
    //	UIGraphicsBeginImageContext( canvasSize );
	UIGraphicsBeginImageContextWithOptions( canvasSize, NO, self.scale );
    
	CGPoint offset1;
	offset1.x = (canvasSize.width - self.size.width) / 2.0f;
	offset1.y = (canvasSize.height - self.size.height) / 2.0f;
    
	CGPoint offset2;
	offset2.x = (canvasSize.width - image.size.width) / 2.0f;
	offset2.y = (canvasSize.height - image.size.height) / 2.0f;
    
	[self drawAtPoint:offset1 blendMode:kCGBlendModeNormal alpha:1.0f];
	[image drawAtPoint:offset2 blendMode:kCGBlendModeNormal alpha:1.0f];
    
    UIImage * result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

- (UIImage *)roundedRectWith:(float)radius
{
    return [self roundedRectWith:radius cornerMask:UIImageRoundedCornerBottomLeft | UIImageRoundedCornerBottomRight | UIImageRoundedCornerTopLeft | UIImageRoundedCornerTopRight];
}

- (UIImage *)roundedRectWith:(float)radius cornerMask:(UIImageRoundedCorner)cornerMask
{
    UIImageView *bkImageViewTmp = [[[UIImageView alloc] initWithImage:self] autorelease];
    
    int w = self.size.width;
    int h = self.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context,bkImageViewTmp.frame, radius, cornerMask);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage    *newImage = [UIImage imageWithCGImage:imageMasked];
    
    CGImageRelease(imageMasked);
    
    return newImage;
}
@end
