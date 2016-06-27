//
//  CHSecurityCodeView.h
//  test
//
//  Created by CHMac on 15/12/23.
//  Copyright © 2015年 CHMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCodeTools.h"

@interface CHSecurityCodeView : UIView

@property(nonatomic,strong)UIImage *bgImg;//背景图片

/**
 *  @author Chen, 15-12-23
 *
 *  刷新验证码
 *
 *  @param completeBlock 成功回调 验证码
 */
-(void)refreshCompleteWith:(void(^)(NSString *securityCode))completeBlock;

@end
