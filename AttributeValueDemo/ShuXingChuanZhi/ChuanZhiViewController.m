//
//  ChuanZhiViewController.m
//  ShuXingChuanZhi
//
//  Created by WuYongmin on 16/3/16.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ChuanZhiViewController.h"

@interface ChuanZhiViewController ()

@end

@implementation ChuanZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"text is %@",_text);
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
