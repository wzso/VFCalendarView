//
//  VFMonthView.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Helper.h"
#import "VFMonthView.h"
#import "VFDayView.h"



#define DayViewTagConstant 100


@interface VFMonthView ()
@property (nonatomic, copy) NSString *yearMonthTitle;
@property (nonatomic, getter=isCurrentMonth) BOOL currentMonth;
@end


@implementation VFMonthView
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date {
    NSAssert(date, @"U must specify a date to create a month view.");
    self = [super initWithFrame:frame];
    if (self) {
        self.yearMonthTitle = [NSString stringWithFormat:@"%zd年%zd月", [Helper yearFromDate:date], [Helper monthFromDate:date]];
        [self createSubviewsWithDate:date];
    }
    return self;
}

#pragma mark - UI
- (void)createSubviewsWithDate:(NSDate *)date {
    NSUInteger firstDayOrdinalInWeek = [Helper firstDayOfMonthOrdinalNumberInWeek:date];
    NSUInteger days = [Helper totalDaysInMonth:date];
    NSUInteger todayOrdinalInMonth = [Helper todaysOrdinalInMonth:date];
    self.currentMonth = todayOrdinalInMonth == 0 ? NO : YES;
    
    // Add dayViews.
    NSUInteger column, row;
    CGFloat minY = 0.f;
    CGFloat x = 0.f, y = 0.f;
    CGFloat width = self.bounds.size.width / 7.f;
    CGFloat height = width + 10.f;
    
    for (NSUInteger i = firstDayOrdinalInWeek - 1; i < days + firstDayOrdinalInWeek - 1; i ++) {
        column = i % 7;
        row = i / 7;
        x = column * width;
        y = row * height + minY;
        CGRect frame = CGRectMake(x, y, width, height);
        NSUInteger dayOrdinalInMonth = i - firstDayOrdinalInWeek + 2;
        BOOL weekend = column == 0 || column == 6;
        VFDayView *dayView = [[VFDayView alloc] initWithFrame:frame dayOrdinalInMonth:dayOrdinalInMonth weekend:weekend];
        // Set day ordinal in month as view's tag.
        dayView.tag = dayOrdinalInMonth + DayViewTagConstant;
        // If the dayView is displaying today, the is should be treated specially.
        if (dayOrdinalInMonth == todayOrdinalInMonth) {
            dayView.today = YES;
            dayView.highlighted = YES;
        }
        [self addSubview:dayView];
    }
    
    // Adjust height.
    CGRect frame = self.frame;
    frame.size.height = y + height;
    self.frame = frame;
    self.clipsToBounds = YES;
}

@end
