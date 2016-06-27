//
//  NSDate+CHAdd.m
//  test
//
//  Created by CHMac on 16/1/26.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#import "NSDate+CHAdd.h"

@implementation NSDate (CHAdd)

- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddDays:1];
    return [added isToday];
}
-(NSDate *)dateByAddYears:(NSInteger)year{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setYear:year];
    return [cal dateByAddingComponents:com toDate:self options:0];
}
-(NSDate *)dateByAddMonths:(NSInteger)month{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setMonth:month];
    return [cal dateByAddingComponents:com toDate:self options:0];
}
-(NSDate *)dateByAddWeeks:(NSInteger)week{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setWeekOfYear:week];
    return [cal dateByAddingComponents:com toDate:self options:0];
}
-(NSDate *)dateByAddDays:(NSInteger)day{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setDay:day];
    return [cal dateByAddingComponents:com toDate:self options:0];
}
-(NSDate *)dateByAddHours:(NSInteger)hour{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setHour:hour];
    return [cal dateByAddingComponents:com toDate:self options:0];
}
-(NSDate *)dateByAddMinutes:(NSInteger)minute{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setMinute:minute];
    return [cal dateByAddingComponents:com toDate:self options:0];
}
-(NSDate *)dateByAddSeconds:(NSInteger)second{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [[NSDateComponents alloc]init];
    [com setSecond:second];
    return [cal dateByAddingComponents:com toDate:self options:0];
}


@end
