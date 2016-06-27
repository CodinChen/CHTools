//
//  WQKetChain.h
//  kc1
//
//  Created by CHMac on 16/1/11.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQKeyChain : NSObject

/**
 *  @author Chen, 16-01-11
 *
 *  储存
 *
 *  @param service 标识
 *  @param data    参数字典
 */
+ (void)save:(NSString *)service data:(id)data;
/**
 *  @author Chen, 16-01-11
 *
 *  读取
 *
 *  @param service 标识
 *
 *  @return 参数字典
 */
+ (id)load:(NSString *)service;
/**
 *  @author Chen, 16-01-11
 *
 *  删除
 *
 *  @param service 标识
 */
+ (void)delete:(NSString *)service ;

@end
