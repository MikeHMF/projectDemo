//
//  ViewController.m
//  UIViewExtDemo
//
//  Created by WuYongmin on 16/5/13.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view  = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 200, 30)];
    NSLog(@"view height %f",view.height);
    NSLog(@"view right is %f",view.right);
    NSLog(@"view left is %f",view.left);
    NSLog(@"view bottom is %f",view.bottom);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
