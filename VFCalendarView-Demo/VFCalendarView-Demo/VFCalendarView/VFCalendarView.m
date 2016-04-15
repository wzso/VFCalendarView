//
//  VFCalendarView.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/15/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "VFCalendarView.h"
#import "VFMonthView.h"
#import "Helper.h"


@interface VFCalendarView ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end


@implementation VFCalendarView

- (instancetype)initWithFrame:(CGRect)frame fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubiewsForDates:[Helper datesArrayFormedByOneDatePerMonthFromDate:fromDate toDate:toDate]];
    }
    return self;
}

- (void)createSubiewsForDates:(NSArray <NSDate *>*)dates {
    // Weekday indicators.
    NSArray *titles = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    CGFloat labelY = 0.f;
    UIColor *gray = [UIColor grayColor];
    UIColor *black = [UIColor blackColor];
    for (int i = 0; i < titles.count; i ++) {
        
    }
    // ScrollView with month views.
    // Month views.
}

@end
