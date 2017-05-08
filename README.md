# VFCalendarView
A Objective-C implementation of calendar view for iOS.


## Some tips

All the math job about date is done by `NSCalendar`. You can check it out in `Helper.m`. There are detailed comments.

## Usage

You can easily initialize a calendar view by providing the right frame, a starting and an ending date.

```
VFCalendarView *cal = [[VFCalendarView alloc] initWithFrame:CGRectMake(0, 30.f, CGRectGetWidth(self.view.bounds), 0) fromDate:[NSDate date] toDate:[Helper changeMonthFrom:[NSDate date] byIncrement:3]];
[self.view addSubview:cal];
```

## Screenshots

Current day looks like this:

![current day](https://github.com/zssr/VFCalendarView/blob/master/screenshots/today.png)

Highlighted days look like this:

![highlighted](https://github.com/zssr/VFCalendarView/blob/master/screenshots/highlights.png)
