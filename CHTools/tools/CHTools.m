//
//  CHTools.m
//  test
//
//  Created by CHMac on 16/3/28.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#import "CHTools.h"
#import <mach/mach.h>


@implementation CHTools

-(double)getMemoryUsage{
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    double memoryUsageInMB = kerr == KERN_SUCCESS ? (info.resident_size / 1024.0 / 1024.0) : 0.0;
    return memoryUsageInMB;
}

@end
