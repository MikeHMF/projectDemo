//
//  ViewController.m
//  UIAlertViewDemo
//
//  Created by WuYongmin on 16/3/17.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)actionButton:(id)sender;

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

- (IBAction)actionButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"类别修改" message:@" " delegate:self
                                          cancelButtonTitle:@"取消" otherButtonTitles:@"修改",nil];
    alert.alertViewStyle  = UIAlertViewStylePlainTextInput;
 
    [alert show];
    
}
- (void)didPresentAlertView:(UIAlertView *)alertView
{
    UITextField *textField = [alertView textFieldAtIndex:0];
    NSLog(@"present is %@",textField.text);

}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //得到输入框
    UITextField *tf=[alertView textFieldAtIndex:0];
    NSString * name = tf.text;
    NSLog(@"name is %@",name);
}

@end
