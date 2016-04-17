//
//  VFCalendarView.h
//  VFCalendarView-Demo
//
//  Created by HS on 4/15/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFCalendarView : UIView

/// When the calendar view scrolls horizonally, its height is setted by the highest month view displayed.
- (instancetype)initWithFrame:(CGRect)frame fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

@end
