//
//  Helper.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Helper.h"



@implementation Helper
+ (NSInteger)firstDayOfMonthOrdinalNumberInWeek:(NSDate *)date {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    currentCalendar.firstWeekday = 1;
    NSDateComponents *dateComp = [currentCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    dateComp.day = 1;
    NSDate *firstDayDate = [currentCalendar dateFromComponents:dateComp];
    NSUInteger firstDayOrdinal = [currentCalendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayDate];
    return firstDayOrdinal;
}


+ (NSDate *)changeMonthFrom:(NSDate *)date byIncrement:(NSInteger)increment {
    if (!increment) return date;
    
    NSDateComponents *dateComp = [[NSDateComponents alloc] init];
    dateComp.month = increment;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComp toDate:date options:NSCalendarMatchStrictly];
    return newDate;
}

+ (NSUInteger)totalDaysInMonth:(NSDate *)date {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

+ (NSUInteger)todaysOrdinalInMonth:(NSDate *)date {
    NSDate *today = [NSDate date];
    if ([self isDate:date inTheSameMonthWithDate:today])
        return [self dayFromDate:today];
    
    // If they are not in the same month, then return 0.
    return 0;
}

+ (NSUInteger)dayFromDate:(NSDate *)date {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComp = [currentCalendar components:NSCalendarUnitDay fromDate:date];
    return dateComp.day;
}

+ (NSUInteger)monthFromDate:(NSDate *)date {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComp = [currentCalendar components:NSCalendarUnitMonth fromDate:date];
    return dateComp.month;
}

+ (NSUInteger)yearFromDate:(NSDate *)date {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComp = [currentCalendar components:NSCalendarUnitYear fromDate:date];
    return dateComp.year;
}

+ (BOOL)isDate:(NSDate *)dateA inTheSameMonthWithDate:(NSDate *)dateB {
    NSUInteger yearA = [self yearFromDate:dateA];
    NSUInteger monthA = [self monthFromDate:dateA];
    NSUInteger yearB = [self yearFromDate:dateB];
    NSUInteger monthB = [self monthFromDate:dateB];
    
    return (yearA == yearB) && (monthA == monthB);
}

+ (NSArray <NSDate *>*)datesArrayFormedByOneDatePerMonthFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    if ([fromDate compare:toDate] != NSOrderedAscending) return nil;
    if ([self isDate:fromDate inTheSameMonthWithDate:toDate]) return @[fromDate];
    
    NSMutableArray *dates = [NSMutableArray arrayWithObject:fromDate];
    for (NSDate *nextDate = [self changeMonthFrom:fromDate byIncrement:1];
         ![self isDate:nextDate inTheSameMonthWithDate:toDate];
         nextDate = [self changeMonthFrom:nextDate byIncrement:1]) {
        // L
        [dates addObject:nextDate];
    }
    [dates addObject:toDate];
    
    return dates;
}
@end
