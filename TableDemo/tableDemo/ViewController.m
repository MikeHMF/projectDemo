//
//  ViewController.m
//  tableDemo
//
//  Created by WuYongmin on 16/5/26.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

#define screenWidth [[UIScreen mainScreen]bounds].size.width    //屏幕宽度
#define screenHeiht [[UIScreen mainScreen]bounds].size.height   //屏幕高度

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)  UIView *bottomSubView;
@property (strong, nonatomic)  UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTableView];
}

- (void)initTableView {
    
    NSLog(@"height is %f",self.navigationController.navigationBar.frame.size.height) ;
    
    
    self.bottomSubView = [[UIView alloc]initWithFrame:CGRectMake(0,screenHeiht-44, screenWidth, 44)];
    self.bottomSubView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.bottomSubView];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 66, screenWidth, screenHeiht-self.bottomSubView.frame.size.height-66)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
    
    [self. bottomSubView removeFromSuperview];
    
    self.tableView.frame =CGRectMake(0,66, screenWidth, screenHeiht-66);
  
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    cell.textLabel.text =[NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
