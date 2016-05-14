//
//  ViewController.m
//  segment
//
//  Created by HR_W on 16/4/22.
//  Copyright © 20
//16年 admin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HRExtention.h"
#import "HRTabView.h"
#import "HRTableViewOne.h"
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self settingScrollView];
    [self settingSegment];
}

- (void)settingScrollView{
    
    HRTabView *tableView = [[HRTabView alloc] initWithFrame:CGRectMake(self.view.width,64, self.view.width, self.view.height-64-49)];
    HRTableViewOne *tableViewOne = [[HRTableViewOne alloc] initWithFrame:CGRectMake(0,64, self.view.width, self.view.height-64-49)];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
   
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    
    scrollView.contentInset = UIEdgeInsetsMake(-64, 0, -49, 0);
        //[tableView addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(2 *self.view.width, self.view.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:scrollView];
    [scrollView addSubview:tableView];
    [scrollView addSubview:tableViewOne];
    _scrollView = scrollView;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    
    self.segment.selectedSegmentIndex = offset/self.view.width;
}

- (void)settingSegment{
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"电话"]];
    
    self.navigationItem.titleView = segment;
    
    segment.width = 120;
    segment.selectedSegmentIndex = 0;
    
    [segment addTarget:self action:@selector(segmentBtnClick) forControlEvents:UIControlEventValueChanged];
    _segment = segment;
    

}

- (void)segmentBtnClick{
    NSLog(@"改变值");
    self.scrollView.contentOffset = CGPointMake(self.segment.selectedSegmentIndex * self.view.width, 0);
}




@end
