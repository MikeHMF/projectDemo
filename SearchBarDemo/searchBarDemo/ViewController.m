//
//  ViewController.m
//  searchBarDemo
//
//  Created by WuYongmin on 16/5/13.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    self.tapGestureRecognizer.cancelsTouchesInView = NO;
    self.tapGestureRecognizer.delegate = self;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:self.tapGestureRecognizer];

    
    self.searchBar = [[MLSearchBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 44) boardColor:[UIColor lightGrayColor] placeholderString:nil];
   
    
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    self.searchBar.boardColor = [UIColor greenColor];
    self.searchBar.barStyle = UIBarStyleBlackTranslucent;
    
    self.searchBar.placeholder = @"输入xxx";
}


-(void)keyboardHide:(UITapGestureRecognizer*)tap{

    [self.searchBar resignFirstResponder];
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    NSLog(@"should begin editing");
    return YES;
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    NSLog(@"should begin editing");
    
}



- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    NSLog(@"should end Editing");
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    
    NSLog(@"didchange is %@",searchText);
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"searchButtonClick");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
