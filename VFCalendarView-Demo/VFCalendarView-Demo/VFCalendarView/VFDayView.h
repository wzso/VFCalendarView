//
//  VFDayView.h
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFDayView : UIView
@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic, getter=isToday) BOOL today;

- (instancetype)initWithFrame:(CGRect)frame dayOrdinalInMonth:(NSUInteger)ordinal weekend:(BOOL)weekend;

@end
