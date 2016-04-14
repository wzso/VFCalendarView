//
//  VFMonthView.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "VFMonthView.h"

@interface VFMonthView ()
@property (nonatomic) CGFloat height;
@property (nonatomic, strong) NSDate *date;
@end


@implementation VFMonthView
- (instancetype)initWithWidth:(CGRect)frame date:(NSDate *)date {
    self = [super initWithFrame:frame];
    if (self) {
        self.date = date;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    
}


- (CGFloat)monthViewHeightWithWidth:(CGFloat)width {
    return 0;
}


@end
