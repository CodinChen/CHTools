//
//  CHMacro.h
//  test
//
//  Created by CHMac on 16/3/28.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#ifndef CHMacro_h
#define CHMacro_h

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfile:%s\nfunction:%s line:%d content:%s\n",__FILE__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//主线程异步
#define ch_safe_async_main(block,...) do {\
    if ([NSThread isMainThread]) {\
        block(__VA_ARGS__);\
    }else{\
        dispatch_async(dispatch_get_main_queue(), ^{\
        block(__VA_ARGS__);\
        });\
    }\
}while(0)

//手动消除警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
if ([self respondsToSelector:@selector(ceeo)]) {
    NSLog(@"222");
}
#pragma clang diagnostic pop

#endif /* CHMacro_h */
