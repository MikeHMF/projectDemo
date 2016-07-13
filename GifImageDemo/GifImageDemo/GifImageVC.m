//
//  GifImageVC.m
//  GifImageDemo
//
//  Created by WuYongmin on 16/7/13.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "GifImageVC.h"

@interface GifImageVC ()
@property (nonatomic, strong) NSTimer *animationTimer;
@end

@implementation GifImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *fishAni=[[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:fishAni];
    
    //设置动画帧
    fishAni.animationImages=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"1.jpg"],
                             [UIImage imageNamed:@"2.jpeg"],
                             [UIImage imageNamed:@"3.jpeg"],
                             [UIImage imageNamed:@"4.jpeg"],
                             [UIImage imageNamed:@"5.jpg"],
                             nil ];
    
//    //设置动画总时间
//    fishAni.animationDuration=5.0;
    
    /**
     *设置动画次数 0 表示无限
     */
    fishAni.animationRepeatCount=0;
    fishAni.animationDuration = 1;//设置动画时间
    //开始动画
    [fishAni startAnimating];
   
    NSInteger AnimationNtimer =3.0;
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval: AnimationNtimer target:self selector:@selector(ArrowAnimationPlay:) userInfo:nil repeats: NO];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 150, 60, 30)];
    titleLabel.backgroundColor = [UIColor redColor];
    titleLabel.text = @"斌彬哥";
    [self.view addSubview:titleLabel];
    
}

//播放结束后的事件。

-(void)ArrowAnimationPlay:(NSTimer *) timer{
    
    [self.animationTimer invalidate];
    self.animationTimer = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"wtq" message:@"I have a message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
//    [alert show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
