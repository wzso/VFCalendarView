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
/// In the whole calendar only one day can be highlighted. When highlighted, it will carry a black disk. When it is today, otherwise the disk black.
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (nonatomic, getter=isToday) BOOL today;

- (instancetype)initWithFrame:(CGRect)frame dayOrdinalInMonth:(NSUInteger)ordinal weekend:(BOOL)weekend;

@end
