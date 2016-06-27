//
//  UIViewController+CHVC.m
//  test
//
//  Created by CHMac on 15/12/30.
//  Copyright © 2015年 CHMac. All rights reserved.
//

#import "UIViewController+CHVC.h"
#import <objc/runtime.h>

@implementation UIViewController (CHVC)

+(void)load{
    Method method1 = class_getInstanceMethod([UIViewController class], NSSelectorFromString(@"viewDidLoad"));
    Method method2 = class_getInstanceMethod(self.class, NSSelectorFromString(@"myViewDidLoad"));
    method_exchangeImplementations(method1, method2);
}

-(void)myViewDidLoad{
    
    
    [self myViewDidLoad];
}

@end
