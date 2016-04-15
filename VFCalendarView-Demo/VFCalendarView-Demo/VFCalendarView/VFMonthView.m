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
@property (nonatomic) CGFloat height;
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
    
    // Add day views.
    CGFloat minY = 20.f;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 7.f;
    CGFloat height = width + 15.f;
    NSUInteger column, row;
    CGFloat x, y;
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
        [self addSubview:dayView];
    }
    
    // Set the height of
}

#pragma mark - UI-Actions
- (void)lastMonthButtonClick {
    
}


- (CGFloat)monthViewHeightWithWidth:(CGFloat)width {
    return 0;
}


@end
