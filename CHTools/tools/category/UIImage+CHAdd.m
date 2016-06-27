//
//  UIImage+CHAdd.m
//  test
//
//  Created by CHMac on 16/2/26.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#import "UIImage+CHAdd.h"

@implementation UIImage (CHAdd)

+(instancetype)imageCircleWithColor:(UIColor *)color size:(CGSize)size{
    return [UIImage imageWithColor:color size:size isRect:NO];
}

+(instancetype)imageRectWithColor:(UIColor *)color size:(CGSize)size{
    return [UIImage imageWithColor:color size:size isRect:YES];
}

+(instancetype)imageWithColor:(UIColor *)color size:(CGSize)size isRect:(BOOL)isRect{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    //    UIGraphicsBeginImageContext(rect.size);
    //size 透明 缩放
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    if (isRect) {
        CGContextFillRect(context, rect);
    }else
        CGContextFillEllipseInRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
