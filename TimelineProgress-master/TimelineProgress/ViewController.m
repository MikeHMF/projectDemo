//
//  ViewController.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "ViewController.h"
#import "TimeLineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect viewFrame = CGRectMake(0, 80, self.view.width, self.view.height);
    TimeLineView *view = [[TimeLineView alloc] initWithFrame:viewFrame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i=0; i<1; i++) {
        TimeLineAtom *atom = [[TimeLineAtom alloc] init];
        atom.text = [NSString stringWithFormat:@"积分奖励 申请成功%d", i];
        [array addObject:atom];
    }
    [view addInitialAtoms:array withAnimation:YES];
}

@end
