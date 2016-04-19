//
//  VFCalendarView.m
//  VFCalendarView-Demo
//
//  Created by Vincent on 4/15/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "VFCalendarView.h"
#import "VFMonthView.h"
#import "Helper.h"


#define SpecialGreen [UIColor colorWithRed:0.7 green:1.f blue:0.85 alpha:1.f]


@interface VFCalendarView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic) NSUInteger pageIndex;
@end


@implementation VFCalendarView

- (instancetype)initStartingFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    self = [super initWithFrame:SCREEN_BOUNDS];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self addTarget:self action:@selector(removeFromSuperview) forControlEvents:UIControlEventAllEvents];
        [self createSubiewsForDates:[Helper datesArrayFormedByOneDatePerMonthFromDate:fromDate toDate:toDate]];
    }
    return self;
}

- (void)createSubiewsForDates:(NSArray <NSDate *>*)dates {
    UIColor *whiteColor = [UIColor whiteColor];
    // Background view.
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = whiteColor;
    backgroundView.layer.cornerRadius = 10.f;
    backgroundView.layer.borderColor = [UIColor blackColor].CGColor;
    backgroundView.layer.borderWidth = 0.5;
    backgroundView.layer.masksToBounds = YES;
    [self addSubview:backgroundView];
    
    CGFloat margin = 2.f;
    CGFloat width = SCREEN_WIDTH - 2 * margin;
    
    // Top buttons and title label.
    // Left button.
    CGFloat buttonHeight = 40.f;
    CGFloat buttonWidth = 50.f;
    CGFloat leftButtonX = 0.f;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(leftButtonX, 0, buttonWidth, buttonHeight)];
    leftButton.backgroundColor = whiteColor;
    [leftButton setTitle:@"<" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:leftButton];
    self.leftButton = leftButton;
    // Right button.
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(width - leftButtonX - buttonWidth, 0, buttonWidth, buttonHeight)];
    rightButton.backgroundColor = whiteColor;
    [rightButton setTitle:@">" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:rightButton];
    self.rightButton = rightButton;
    // Title label.
    CGFloat titleLabelX = CGRectGetMaxX(leftButton.frame);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, 0, CGRectGetMinX(rightButton.frame) - titleLabelX, buttonHeight)];
    titleLabel.backgroundColor = whiteColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = SpecialGreen;
    [backgroundView addSubview:titleLabel];
    self.title = titleLabel;
    
    // Weekday indicators.
    NSArray *titles = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    CGFloat labelY = CGRectGetMaxY(leftButton.frame);
    CGFloat labelHeight = 25.f;
    CGFloat labelWidth = width / titles.count;
    for (int i = 0; i < titles.count; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * labelWidth, labelY, labelWidth, labelHeight)];
        label.backgroundColor = whiteColor;
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        if (i == 0 || i == 6) {
            label.textColor = SpecialGreen;
        }
        [backgroundView addSubview:label];
    }
    
    // ScrollView with month views.
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [backgroundView addSubview:scrollView];
    self.scrollView = scrollView;
    
    // Month views.
    CGFloat maxHeight = 0;
    // Page index of current month. If current month is not displayed, then it will stay -1. It helps mark the current month so as to set current month as the default page of scroll view.
    NSInteger currentMonthPageIndex = -1;
    NSMutableArray *titlesArray = [NSMutableArray arrayWithCapacity:dates.count];
    for (int i = 0; i < dates.count; i ++) {
        VFMonthView *monthView = [[VFMonthView alloc] initWithFrame:CGRectMake(i * width, 0, width, 0) date:dates[i]];
        [scrollView addSubview:monthView];
        CGFloat monthViewHeight = CGRectGetHeight(monthView.frame);
        if (monthViewHeight > maxHeight) {
            maxHeight = monthViewHeight;
        }
        if (monthView.isCurrentMonth) {
            currentMonthPageIndex = i;
            DebugLog(@"CurrentMonthPageIndex = %d", i);
        }
        titlesArray[i] = monthView.yearMonthTitle;
    }
    self.titles = titlesArray;
    
    // Adjust scroll view.
    scrollView.frame = CGRectMake(0, labelHeight + labelY, width, maxHeight);
    scrollView.contentSize = CGSizeMake(dates.count * width, maxHeight);
    // If current month is displayed in scroll view and not in first page, then set it as the default page.
    if (currentMonthPageIndex > 0) {
        scrollView.contentOffset = CGPointMake(currentMonthPageIndex * width, 0);
        self.pageIndex = currentMonthPageIndex;
        [self updateButtonsAndTitle];
    }
    
    // Adjust background view size.
    CGFloat backgroundViewHeight = CGRectGetMaxY(scrollView.frame);
    backgroundView.frame = CGRectMake(margin, (SCREEN_HEIGHT - backgroundViewHeight) / 2.f, width, backgroundViewHeight);
}

- (void)showOnView:(UIView *)superView {
    [superView addSubview:self];
}

- (void)updateButtonsAndTitle {
    NSUInteger index = self.pageIndex;
    self.title.text = self.titles[index];
    if (index == 0) {
        self.leftButton.hidden = YES;
    }
    else if (index == self.titles.count - 1) {
        self.rightButton.hidden = YES;
    }
    else {
        self.leftButton.hidden = NO;
        self.rightButton.hidden = NO;
    }
}

- (void)updateScrollViewContentOffset {
    [self.scrollView setContentOffset:CGPointMake(self.pageIndex * self.scrollView.frame.size.width, 0) animated:YES];
}

#pragma mark Action
- (void)leftButtonClick {
    DebugLog(@"Previous month.");
    self.pageIndex --;
    [self updateScrollViewContentOffset];
    [self updateButtonsAndTitle];
}

- (void)rightButtonClick {
    DebugLog(@"Next month.");
    self.pageIndex ++;
    [self updateScrollViewContentOffset];
    [self updateButtonsAndTitle];
}

#pragma mark - Delegate Methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    [self updateButtonsAndTitle];
    DebugLog(@"%zd", self.pageIndex);
}

@end
