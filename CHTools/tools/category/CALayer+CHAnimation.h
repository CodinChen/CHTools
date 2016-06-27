//
//  CALayer+CHAnimation.h
//  test
//
//  Created by CHMac on 16/4/18.
//  Copyright © 2016年 CHMac. All rights reserved.
//  扩展动画

#import <QuartzCore/QuartzCore.h>

@interface CALayer (CHAnimation)

/*!
 *  @author Chen, 16-04-18
 *
 *  扩散动画
 *
 *  @param completeBlock 完成回调
 */
-(void)expandAnimationComplete:(void(^)())completion;
/*!
 *  @author Chen, 16-04-18
 *
 *  收缩动画
 *
 *  @param completeBlock 完成回调
 */
-(void)shrinkAnimationComplete:(void(^)())completion;
/*!
 *  @author Chen, 16-04-21
 *
 *  抖动动画
 *
 *  @param completion 完成回调
 */
-(void)shakeAnimationComplete:(void(^)())completion;

@end
