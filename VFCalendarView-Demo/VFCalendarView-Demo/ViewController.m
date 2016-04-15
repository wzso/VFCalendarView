//
//  ViewController.m
//  VFCalendarView-Demo
//
//  Created by HS on 4/14/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "ViewController.h"
#import "VFMonthView.h"
#import "Helper.h"




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VFMonthView *monthView = [[VFMonthView alloc] initWithFrame:CGRectMake(0.f, 30.f, self.view.bounds.size.width, 0.f) date:[Helper changeMonthFrom:[NSDate date] byIncrement:0]];
    [self.view addSubview:monthView];
}


@end
