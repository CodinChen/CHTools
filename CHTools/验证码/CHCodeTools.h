//
//  CHCodeTools.h
//  test
//
//  Created by CHMac on 15/12/23.
//  Copyright © 2015年 CHMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCodeTools : NSObject

/**
*  @author Chen, 15-12-23
*
*  获取随机数 [min,max]
*
*  @param max 最大范围
*  @param min 最小范围
*
*  @return 随机数
*/
+(NSInteger)getRandomNumberWithMax:(NSInteger)max andMin:(NSInteger)min;

/**
 *  @author Chen, 15-12-23
 *
 *  获取随机n位字母或数字
 *
 *  @param count 获取字符个数
 *
 *  @return 由数字字母随机组合的字符串
 */
+(NSString *)getRandomSecurityCodeWithCount:(int)count;
/**
 *  @author Chen, 15-12-23
 *
 *  校验验证码是否正确
 *
 *  @param code      生成的验证码
 *  @param scanfCode 输入的验证码
 *
 *  @return 是否相同 Y:相同 N:不同
 */
+(BOOL)checkSecurityCodeWithCode:(NSString *)code andScanfCode:(NSString *)scanfCode;

@end
