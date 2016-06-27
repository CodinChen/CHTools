//
//  UIImage+CHAdd.h
//  test
//
//  Created by CHMac on 16/2/26.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHAdd)

/**
 *  @author Chen, 16-02-26
 *
 *  创建圆形纯色图片
 *
 *  @param color 颜色
 *  @param size  size
 *
 *  @return UIImage
 */
+(instancetype)imageCircleWithColor:(UIColor *)color size:(CGSize)size;

+(instancetype)imageRectWithColor:(UIColor *)color size:(CGSize)size;

@end
