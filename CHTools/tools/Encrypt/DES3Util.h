//
//  DES3Util.h
//  AESEncryption
//
//  Created by Alex Pong on 13-4-12.
//
//

#import <Foundation/Foundation.h>

@interface DES3Util : NSObject
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText;
+ (NSString*)encrypt:(NSString*)plainText withKey:(NSString *)key;

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText;
+ (NSString*)decrypt:(NSString*)encryptText withKey:(NSString *)key;

// URL编码
+ (NSString *)urlEncode:(NSString *)encodeText;

// URL解码
+ (NSString *)urlDecode:(NSString *)text;

// MD5加密
+ (NSString *)md5:(NSString *)str;
@end
