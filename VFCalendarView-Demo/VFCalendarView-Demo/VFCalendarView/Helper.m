//
//  Helper.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Helper.h"
#import "Header.h"

@implementation Helper
+ (NSInteger)firstDayOrdinalityOfMonth:(NSDate *)date {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    currentCalendar.firstWeekday = 1;
    NSDateComponents *dateComp = [currentCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    dateComp.day = 1;
    NSDate *firstDayDate = [currentCalendar dateFromComponents:dateComp];
    NSUInteger firstDayOrdinality = [currentCalendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayDate];
    DebugLog(@"FirstDayOrdinality: %zd", firstDayOrdinality);
    return firstDayOrdinality;
}


+ (NSDate *)changeMonthFrom:(NSDate *)date byIncrement:(NSInteger)increment {
    NSDateComponents *dateComp = [[NSDateComponents alloc] init];
    dateComp.month = increment;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComp toDate:date options:NSCalendarMatchStrictly];
    return newDate;
}

+ (NSUInteger)totalDaysInMonth:(NSDate *)date {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

+ (NSUInteger)numberOfWeekLinesInMonth:(NSDate *)date {
    return 5;
}
@end
