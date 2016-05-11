//
//  ViewController.m
//  chartDemo
//
//  Created by WuYongmin on 16/5/11.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) PNLineChartView *lineChartView;
- (IBAction)buttonAdd:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lineChartView = [[PNLineChartView alloc]initWithFrame:CGRectMake(4, 79, 316, 250)];
    self.lineChartView.backgroundColor = [UIColor whiteColor];
   [self.view addSubview:self.lineChartView];
    
    
    // test line chart
    NSArray* plottingDataValues1 =@[@22, @33, @12, @23,@43, @32,@53, @33, @54,@55, @43];
    
    self.lineChartView.max = 58;
    self.lineChartView.min = 12;
    
    
    self.lineChartView.interval = (self.lineChartView.max-self.lineChartView.min)/5;
    
    NSMutableArray* yAxisValues = [@[] mutableCopy];
    for (int i=0; i<6; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", self.lineChartView.min+self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    self.lineChartView.xAxisValues = @[@"1", @"2", @"3",@"4", @"5", @"6",@"7", @"8", @"9",@"10", @"11"];
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = plottingDataValues1;
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 0.5;
    
    [self.lineChartView addPlot:plot1];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAdd:(id)sender {
    
    [self.lineChartView removeFromSuperview];
    
    self.lineChartView = [[PNLineChartView alloc]initWithFrame:CGRectMake(4, 79, 316, 250)];
    self.lineChartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.lineChartView];
    
    
    // test line chart
    NSArray* plottingDataValues1 =@[@22, @33, @12, @23,@43, @32,@53, @33, @54,@55, @43];

    
    self.lineChartView.max = 58;
    self.lineChartView.min = 12;
    self.lineChartView.pointerInterval =105;
    
    self.lineChartView.interval = (self.lineChartView.max-self.lineChartView.min)/5;
    
    
    NSMutableArray* yAxisValues = [@[] mutableCopy];
    for (int i=0; i<6; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", self.lineChartView.min+self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    self.lineChartView.xAxisValues = @[@"1", @"2", @"3",@"4", @"5", @"6",@"7", @"8", @"9",@"10", @"11"];
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = plottingDataValues1;
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 0.5;
    
    [self.lineChartView addPlot:plot1];

    
}



@end
