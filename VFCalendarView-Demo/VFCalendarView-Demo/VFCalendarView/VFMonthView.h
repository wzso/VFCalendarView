//
//  VFMonthView.h
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFMonthView : UIView

/// Height specified in `frame` won't be adopted, so you can pass 0 for convenience.
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date;

@end
