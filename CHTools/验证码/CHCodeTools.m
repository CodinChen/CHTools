//
//  CHCodeTools.m
//  test
//
//  Created by CHMac on 15/12/23.
//  Copyright © 2015年 CHMac. All rights reserved.
//

#import "CHCodeTools.h"

#define CODESTRING @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

@implementation CHCodeTools

+(NSInteger)getRandomNumberWithMax:(NSInteger)max andMin:(NSInteger)min{
    return min+arc4random()%(max-min+1);
}

+(NSString *)getRandomSecurityCodeWithCount:(int)count{
    
    if (count <1) return @"";
    
    NSMutableString *targetStr = [NSMutableString stringWithString:@""];
    
    for (NSInteger i = 0; i<count; i++) {
        NSRange range = NSMakeRange(arc4random()%[CODESTRING length], 1);
        [targetStr appendString:[CODESTRING substringWithRange:range]];
    }
    return targetStr;
}
+(BOOL)checkSecurityCodeWithCode:(NSString *)code andScanfCode:(NSString *)scanfCode{
    return [code caseInsensitiveCompare:scanfCode] == NSOrderedSame;
}

@end
