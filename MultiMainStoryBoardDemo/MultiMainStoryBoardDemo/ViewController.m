//
//  ViewController.m
//  MultiMainStoryBoardDemo
//
//  Created by WuYongmin on 16/5/4.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)FirstButton:(id)sender;

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

- (IBAction)FirstButton:(id)sender {
    
    UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    
    UIViewController* viewcontroller2 = [secondStoryBoard instantiateViewControllerWithIdentifier:@"test2"]; //test2为viewcontroller2的StoryboardId
    
    [self.navigationController pushViewController: viewcontroller2 animated:YES];

}
@end
