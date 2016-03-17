//
//  ViewController.m
//  ViewRectDemo
//
//  Created by WuYongmin on 16/3/17.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用了：UIView *rectView = [[UIView alloc] initWithFrame:(CGRect){20,100, 200,300}];，代替了CGRectMake(x,y,width,height),提高效率
    UIView *rectView = [[UIView alloc] initWithFrame:(CGRect){20,100, 200,300}];
    rectView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
