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
    CGFloat labelHeight = 25.f;
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat labelWidth = width / titles.count;
    for (int i = 0; i < titles.count; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * labelWidth, labelY, labelWidth, labelHeight)];
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        if (i == 0 || i == 6) {
            label.textColor = [UIColor grayColor];
        }
        [self addSubview:label];
    }
    
    // ScrollView with month views.
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    // Month views.
    CGFloat maxHeight = 0;
    for (int i = 0; i < dates.count; i ++) {
        VFMonthView *monthView = [[VFMonthView alloc] initWithFrame:CGRectMake(i * width, 0, width, 0) date:dates[i]];
        [scrollView addSubview:monthView];
        CGFloat monthViewHeight = CGRectGetHeight(monthView.frame);
        if (monthViewHeight > maxHeight) {
            maxHeight = monthViewHeight;
        }
    }
    
    // Adjust scroll view.
    scrollView.frame = CGRectMake(0, labelHeight + labelY, width, maxHeight);
    scrollView.contentSize = CGSizeMake(dates.count * width, maxHeight);
    // Adjust self size.
    CGRect rect = self.frame;
    rect.size.height = CGRectGetMaxY(scrollView.frame);
    self.frame = rect;
    self.layer.cornerRadius = 10.f;
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 1.f;
}

@end
