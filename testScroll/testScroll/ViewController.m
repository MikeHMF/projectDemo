//
//  ViewController.m
//  testScroll
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 xiaowei project. All rights reserved.
//

#import "ViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//#import "MyCell.h"
#define kImgHieght 170
@interface ViewController ()
//@property (nonatomic,strong)UIScrollView *scroll;
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UITableView *tabView;

@end
static NSString *identity = @"cell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    [self.view addSubview:_tabView];
    _tabView.contentInset = UIEdgeInsetsMake(kImgHieght, 0, 0, 0);
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake (0, -kImgHieght, 320, kImgHieght)];
    _imgView.image = [UIImage imageNamed:@"scene1.jpg"];
//    [_imgView sizeToFit];
//    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    [_tabView addSubview:_imgView];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = _tabView.contentOffset.y;
    NSLog(@"y = %f",y);
    //170
    CGRect f = _imgView.frame;
    CGFloat x = (ABS(y)-64)*kScreenWidth/kImgHieght;
    if(y < -kImgHieght-64){
    f.origin.y = y+64;
    f.size.height = -y-64;
    f.origin.x = -(x-kScreenWidth)/2;
    f.size.width = x;
    _imgView.frame = f;
    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if(cell == nil){
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
   cell.backgroundColor = [UIColor colorWithRed:arc4random()%10*.1 green:arc4random()%10*.1  blue:arc4random()%10*.1  alpha:1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}



@end
