//
//  ViewController.m
//  ShuXingChuanZhi
//
//  Created by WuYongmin on 16/3/16.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"
#import "ChuanZhiViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chuanzhiButton:(id)sender {
    
    //方法一：用self.navigationController pushViewController
    ChuanZhiViewController * chuanzhiViewController = [[ChuanZhiViewController alloc]init];
    chuanzhiViewController.text  = @"方法一";
    //pushViewController或者用presentViewController都行
    [self.navigationController pushViewController:chuanzhiViewController animated:YES];
    //[self presentViewController:chuanzhiViewController animated:YES completion:nil];
    
    
    //方法二：用storyboard
     //[self performSegueWithIdentifier:@"chuanzhiSegue" sender:self];
}


//方法二
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([segue.identifier isEqualToString:@"chuanzhiSegue"]) {
//        ChuanZhiViewController * chuanzhiViewController = segue.destinationViewController;
//        chuanzhiViewController.text =@"方法二";
//    }
//    
//}

@end
