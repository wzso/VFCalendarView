//
//  VFMonthView.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Header.h"
#import "Helper.h"
#import "VFMonthView.h"
#import "VFDayView.h"



#define DayViewTagConstant 100


@interface VFMonthView ()

@end


@implementation VFMonthView
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date {
    NSAssert(date, @"U must specify a date to create a month view.");
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviewsWithDate:date];
    }
    return self;
}

#pragma mark - UI
- (void)createSubviewsWithDate:(NSDate *)date {
    NSUInteger firstDayOrdinalInWeek = [Helper firstDayOfMonthOrdinalNumberInWeek:date];
    NSUInteger days = [Helper totalDaysInMonth:date];
    NSUInteger todayOrdinalInMonth = [Helper todaysOrdinalInMonth:date];
    
    // Add month title label.
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 7.f;
    CGFloat height = width + 15.f;
    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake((firstDayOrdinalInWeek - 1) % 7 * width, 0.f, width, 25.f)];
    monthLabel.text = [NSString stringWithFormat:@"%zd月", [Helper monthFromDate:date]];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    // If this is the current month, the text should be red.
    monthLabel.textColor = todayOrdinalInMonth ? [UIColor redColor] : [UIColor blackColor];
    [self addSubview:monthLabel];
    
    // Add dayViews.
    NSUInteger column, row;
    CGFloat minY = CGRectGetMaxY(monthLabel.frame);
    CGFloat x = 0.f, y = 0.f;
    
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
