//
//  NSString+CHUtil.h
//  test
//
//  Created by CHMac on 15/12/23.
//  Copyright © 2015年 CHMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CHUtil)

/**
 *  @author Chen, 15-12-23
 *
 *  把数组字典转成json字符串
 *
 *  @param data id 类型  字典或数组
 *
 *  @return jsonzifuc
 */
+ (NSString *)toJSONString:(id)data;

+ (NSString *)formatMoney:(NSString *)money;




/**
 *  @author Chen, 15-12-23
 *
 *  把json字符串转成数组或字典
 *
 *  @return 数组或字典
 */
-(id)JSONValue;
/**
 *  @author Chen, 15-12-23
 *
 *  字符串是否为空
 *
 *  @return YES:是  NO:否
 */
-(BOOL)isBlankValue;
/**
 *  @author Chen, 15-12-23
 *
 *  验证是否是身份证号
 *
 *  @return YES:是  NO:否
 */
-(BOOL)isIdentityCardNumber;
/**
 *  @author Chen, 15-12-23
 *
 *  是否是数字
 *
 *  @return YES:是  NO:否
 */
-(BOOL)isNumber;
/**
 *  @author Chen, 15-12-23
 *
 *  RSA 加密
 *
 *  @param publicKey 公钥
 *
 *  @return RSA加密串
 */
-(NSString*)RSA:(NSString *)publicKey;

@end
