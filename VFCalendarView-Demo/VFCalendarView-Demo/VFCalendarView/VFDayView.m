//
//  VFDayView.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "VFDayView.h"


@interface VFDayView ()

@end


@implementation VFDayView

- (instancetype)initWithFrame:(CGRect)frame dayOrdinalNumber:(NSUInteger)ordinal {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviewsWithOridinalNumber:ordinal];
    }
    return self;
}

- (void)createSubviewsWithOridinalNumber:(NSUInteger)ordinal {
    CGFloat width = CGRectGetWidth(self.frame);
    UIButton *ordinalButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    ordinalButton.layer.cornerRadius = width / 2.f;
    ordinalButton.backgroundColor = [UIColor redColor];
    [ordinalButton setTitle:[NSString stringWithFormat:@"%zd", ordinal] forState:UIControlStateNormal];
    [ordinalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:ordinalButton];
}

@end
