//
//  ViewController.m
//  Timlene
//
//  Created by Roma on 9/30/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

#import "ViewController.h"
#import "TimeLineViewControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *times = @[@"",@"",@"",@"",@"",@"",@""];
    NSArray *descriptions = @[@"积分奖励\n申请成功",
                              @"积分奖励\n奖励到账",
                              ];
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:times
                                                           andTimeDescriptionArray:descriptions
                                                                  andCurrentStatus:2
                                                                          andFrame:CGRectMake(50, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    [self.view addSubview:timeline];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
