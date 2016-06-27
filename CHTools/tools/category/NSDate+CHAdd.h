//
//  NSDate+CHAdd.h
//  test
//
//  Created by CHMac on 16/1/26.
//  Copyright © 2016年 CHMac. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface NSDate (CHAdd)

@property (nonatomic, readonly) NSInteger year;//年
@property (nonatomic, readonly) NSInteger month;//月
@property (nonatomic, readonly) NSInteger day;//日
@property (nonatomic, readonly) NSInteger hour;//时
@property (nonatomic, readonly) NSInteger minute;//分
@property (nonatomic, readonly) NSInteger second;//秒
@property (nonatomic, readonly) NSInteger nanosecond;
@property (nonatomic, readonly) NSInteger weekday;
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, readonly) NSInteger quarter;
@property (nonatomic, readonly) BOOL isLeapMonth;
@property (nonatomic, readonly) BOOL isLeapYear;//闰年
@property (nonatomic, readonly) BOOL isToday;
@property (nonatomic, readonly) BOOL isYesterday;

#pragma mark -dateByAdd
-(NSDate *)dateByAddYears:(NSInteger)year;
-(NSDate *)dateByAddMonths:(NSInteger)month;
-(NSDate *)dateByAddWeeks:(NSInteger)week;
-(NSDate *)dateByAddDays:(NSInteger)day;
-(NSDate *)dateByAddHours:(NSInteger)hour;
-(NSDate *)dateByAddMinutes:(NSInteger)minute;
-(NSDate *)dateByAddSeconds:(NSInteger)second;

#pragma mark -dateFormmatte

@end
