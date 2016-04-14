//
//  VFDayView.h
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFDayView : UIView
@property (nonatomic) BOOL selected;
- (instancetype)initWithFrame:(CGRect)frame dayOrdinalNumber:(NSUInteger)ordinal;
@end
