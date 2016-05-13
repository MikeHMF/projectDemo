//
//  ViewController.m
//  SlideDemo
//
//  Created by WuYongmin on 16/5/13.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"
#import "ASValueTrackingSlider.h"

@interface ViewController ()
@property (strong ,nonatomic)  ASValueTrackingSlider *slider33;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // customize slider 3
    NSNumberFormatter *formatter1 = [[NSNumberFormatter alloc] init];
    [formatter1 setNumberStyle:NSNumberFormatterPercentStyle];
    [self.slider33 setNumberFormatter:formatter1];
    self.slider33.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:26];
    self.slider33.popUpViewAnimatedColors = @[[UIColor purpleColor], [UIColor redColor], [UIColor orangeColor]];
    
    self.slider33 = [[ASValueTrackingSlider alloc] initWithFrame:CGRectMake(30,100,200,30)];
    
    
    UIView *subview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    [subview addSubview:self.slider33];
    [self.view addSubview:subview];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
