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
    
    MLSearchBar *searchBar = [[MLSearchBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 44) boardColor:[UIColor lightGrayColor] placeholderString:nil];
    // searchBar.boardLineWidth = 3.0;
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    //    UITextField * searchField = [[searchBar subviews]lastObject];
    
    searchBar.barStyle = UIBarStyleBlackTranslucent;
    
    searchBar.placeholder = @"输入xxx";
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
