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
+ (NSInteger)firstDayOrdinalityOfMonth:(NSDate *)date;
/// Jump to a new month.
/// `Increment` specifies how many month(s) later(`increment > 0`) or ago(`increment < 0`).
+ (NSDate *)changeMonthFrom:(NSDate *)date byIncrement:(NSInteger)increment;
+ (NSUInteger)totalDaysInMonth:(NSDate *)date;
/// Get count of lines in a month view, ranging from 4 to 6.
+ (NSUInteger)numberOfWeekLinesInMonth:(NSDate *)date;
@end
