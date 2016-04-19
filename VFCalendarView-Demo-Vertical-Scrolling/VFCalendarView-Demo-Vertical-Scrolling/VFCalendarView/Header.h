//
//  Header.h
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#ifndef Header_h
#define Header_h

/// Output log to console in DEBUG mode.
#ifndef DebugLog
#if DEBUG
#define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#define DebugLog(fmt, ...)
#endif
#endif



#endif /* Header_h */
