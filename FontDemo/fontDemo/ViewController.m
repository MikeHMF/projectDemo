//
//  ViewController.m
//  fontDemo
//
//  Created by WuYongmin on 16/3/22.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"
#import <IconFont.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:(CGRect){30,70,30,30}];
    
    imgView.image = [IconFont imageWithIcon:[IconFont icon:@"fa_search" fromFont:fontAwesome] fontName:fontAwesome iconColor:[UIColor grayColor] iconSize:24.0f];
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
