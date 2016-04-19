//
//  Helper.h
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject
/// The ordinal number of first day of specifified month. 1 for Sunday, 2 for Monday and 7 for Saturday.
+ (NSInteger)firstDayOfMonthOrdinalNumberInWeek:(NSDate *)date;
/// Jump to a new month.
/// `Increment` specifies how many month(s) later(`increment > 0`) or ago(`increment < 0`).
+ (NSDate *)changeMonthFrom:(NSDate *)date byIncrement:(NSInteger)increment;
+ (NSUInteger)totalDaysInMonth:(NSDate *)date;
/// Get today's ordinal in month, rangin from 1 to 31. Note that if today is not in the specified month, return value will be 0.
+ (NSUInteger)todaysOrdinalInMonth:(NSDate *)date;

/// Grab day from date.
+ (NSUInteger)dayFromDate:(NSDate *)date;
/// Grab month from date.
+ (NSUInteger)monthFromDate:(NSDate *)date;
/// Grab year from date.
+ (NSUInteger)yearFromDate:(NSDate *)date;

/// One date from each month, starting from `fromDate` to `toDate`. To help create monthViews sequence.
+ (NSArray <NSDate *>*)datesArrayFormedByOneDatePerMonthFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
@end
