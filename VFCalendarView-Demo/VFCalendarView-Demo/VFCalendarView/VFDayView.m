//
//  VFDayView.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "VFDayView.h"


#define DefaultFont [UIFont systemFontOfSize:17.f]
#define BoldFont [UIFont boldSystemFontOfSize:18.f]


@interface VFDayView ()
@property (nonatomic, strong) UIColor *normalFontColor;
@property (nonatomic, strong) UILabel *ordinalLabel;
@property (nonatomic, strong) UIView *dot;
@end


@implementation VFDayView

- (instancetype)initWithFrame:(CGRect)frame dayOrdinalInMonth:(NSUInteger)ordinal  weekend:(BOOL)weekend {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviewsWithOridinalNumber:ordinal weekend:weekend];
        [self addTapGestureRecognizer];
    }
    return self;
}

- (void)createSubviewsWithOridinalNumber:(NSUInteger)ordinal weekend:(BOOL)weekend {
    CGFloat width = CGRectGetWidth(self.frame);
    // Line on the top.
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1.f];
    [self addSubview:line];
    
    // Day ordinal number label.
    CGFloat ordinalLabelWidth = width * 0.8;
    CGFloat ordinalLabelOriginX = (width - ordinalLabelWidth) / 2.f;
    UILabel *ordinalLabel = [[UILabel alloc] initWithFrame:CGRectMake(ordinalLabelOriginX, CGRectGetMaxY(line.frame) + 2.f, ordinalLabelWidth, ordinalLabelWidth)];
    ordinalLabel.text = [NSString stringWithFormat:@"%zd", ordinal];
    self.normalFontColor = weekend ? [UIColor grayColor] : [UIColor blackColor];
    ordinalLabel.textColor = self.normalFontColor;
    ordinalLabel.textAlignment = NSTextAlignmentCenter;
    ordinalLabel.font = DefaultFont;
    ordinalLabel.layer.cornerRadius = ordinalLabelWidth / 2.f;
    ordinalLabel.layer.masksToBounds = YES;
    ordinalLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:ordinalLabel];
    self.ordinalLabel = ordinalLabel;
    
    // Dot as a mark.
    CGFloat dotWidth = width * 0.12;
    CGFloat dotOriginX = (width - dotWidth) / 2.f;
    UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(dotOriginX, CGRectGetMaxY(ordinalLabel.frame) + 5.f, dotWidth, dotWidth)];
    dot.layer.cornerRadius = dotWidth / 2.f;
    dot.backgroundColor = [UIColor greenColor];
    [self addSubview:dot];
    self.dot = dot;
}

- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
}

- (void)tapAction {
    self.highlighted = !self.isHighlighted;
}

- (void)setToday:(BOOL)today {
    _today = today;
    if (today) {
        self.ordinalLabel.backgroundColor = self.isHighlighted ? [UIColor redColor] : [UIColor clearColor];
        self.ordinalLabel.font = self.isHighlighted ? BoldFont : DefaultFont;
        self.ordinalLabel.textColor = self.isHighlighted ? [UIColor whiteColor] : [UIColor redColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;

    if (highlighted) {
        self.ordinalLabel.backgroundColor = self.isToday ? [UIColor redColor] : [UIColor blackColor];
        self.ordinalLabel.font = BoldFont;
        self.ordinalLabel.textColor = [UIColor whiteColor];
    } else {
        self.ordinalLabel.textColor = self.normalFontColor;
        self.ordinalLabel.font = DefaultFont;
        self.ordinalLabel.backgroundColor = self.isToday ? [UIColor redColor] : [UIColor clearColor];
    }
}

@end
