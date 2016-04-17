//
//  ViewController.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "ViewController.h"
#import "VFCalendarView.h"
#import "Helper.h"




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VFCalendarView *cal = [[VFCalendarView alloc] initWithFrame:CGRectMake(0, 30.f, CGRectGetWidth(self.view.bounds), 0) fromDate:[NSDate date] toDate:[Helper changeMonthFrom:[NSDate date] byIncrement:3]];
    [self.view addSubview:cal];
}


@end
