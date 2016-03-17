//
//  ViewController.m
//  tableviewCellDemo
//
//  Created by WuYongmin on 16/3/14.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"
#import "SearchCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.tableView.frame = CGRectZero;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *ID = @"cell";
    
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SearchCell" owner:self options:nil] lastObject];
    }

    cell.label1.text = @"11111111111";
    cell.label2.text = @"2222222222222";
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 15;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
