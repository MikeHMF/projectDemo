//
//  ViewController.m
//  UIButtonImage
//
//  Created by WuYongmin on 16/6/2.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    button.frame = CGRectMake(100, 100,50,50);//button的frame
    button.backgroundColor = [UIColor cyanColor];//button的背景颜色
    
    //    [button setBackgroundImage:[UIImage imageNamed:@"man_64.png"] forState:UIControlStateNormal];
    
    //    在UIButton中有三个对EdgeInsets的设置：ContentEdgeInsets、titleEdgeInsets、imageEdgeInsets
    [button setImage:[UIImage imageNamed:@"icon_lianUpset.png"] forState:UIControlStateNormal];//给button添加image
    button.imageEdgeInsets = UIEdgeInsetsMake(5,10,21,button.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    
    [button setTitle:@"首页" forState:UIControlStateNormal];//设置button的title
    button.titleLabel.font = [UIFont systemFontOfSize:12];//title字体大小
    button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    button.titleEdgeInsets = UIEdgeInsetsMake(30, -button.titleLabel.bounds.size.width-30, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
    
    //    [button setContentEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];//
    
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是title和image一起变化
    
    

    
    
    
    
    [self.view addSubview:button];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
