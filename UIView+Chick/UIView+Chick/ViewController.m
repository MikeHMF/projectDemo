//
//  ViewController.m
//  UIView+Chick
//
//  Created by ZhuJX on 16/5/13.
//  Copyright © 2016年 ZhuJX. All rights reserved.
//

#import "ViewController.h"
#import "JXUIView+Touch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 80, 80)];
    view.backgroundColor = [UIColor redColor];
    [view addJXTouch:^{
        NSLog(@"HelloWorld!");
        
    }];
    [self.view addSubview:view];
}



@end
