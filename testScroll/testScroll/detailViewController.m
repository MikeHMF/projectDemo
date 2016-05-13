//
//  detailViewController.m
//  testScroll
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 xiaowei project. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *detail = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    detail.backgroundColor = [UIColor purpleColor];
    
    UIView *list = [[UIView alloc]initWithFrame:CGRectMake(0, 150, 200, 200)];
    list.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:detail];
    [self.view addSubview:list];
    NSLog(@"detail %ld",detail.tag);
    NSLog(@"list :%ld",list.tag);
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
//    [self.view sendSubviewToBack:list];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
