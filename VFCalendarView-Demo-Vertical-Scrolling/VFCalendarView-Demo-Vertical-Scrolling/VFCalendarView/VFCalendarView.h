//
//  VFCalendarView.h
//  VFCalendarView-Demo
//
//  Created by Vincent on 4/15/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFCalendarView : UIButton

/// When the calendar view scrolls horizonally, its height is setted by the highest month view displayed.
- (instancetype)initStartingFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

- (void)showOnView:(UIView *)superView;

@end
