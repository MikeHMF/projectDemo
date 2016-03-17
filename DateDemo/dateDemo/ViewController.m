//
//  ViewController.m
//  dateDemo
//
//  Created by WuYongmin on 16/3/16.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    //实例方法
    NSDate * date = [[NSDate alloc]init];
    NSString * dateString = [date timeIntervalDescription];
    NSLog(@"date is %@",dateString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
