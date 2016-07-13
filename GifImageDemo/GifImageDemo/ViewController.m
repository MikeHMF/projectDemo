//
//  ViewController.m
//  GifImageDemo
//
//  Created by WuYongmin on 16/7/13.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title =@"特效";
    UIButton * confirmButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 90, 80,40)];
    confirmButton.enabled = YES;
    [confirmButton setTitle:@"弹出特效" forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
    
    
}

-(void)action:(id)sender
{
    NSLog(@"111");
    GifImageVC *vc = [[GifImageVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
