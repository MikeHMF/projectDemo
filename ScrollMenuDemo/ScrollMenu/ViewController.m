//
//  ViewController.m
//  ScrollMenu
//
//  Created by ChenBinbin on 16/5/5.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"
#import "Cell1.h"

#define screenWidth [[UIScreen mainScreen]bounds].size.width    //屏幕宽度
#define screenHeiht [[UIScreen mainScreen]bounds].size.height   //屏幕高度

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) NSMutableArray *keyArray;

@property (nonatomic, strong) NSString *index;//左边点击的是第几行

@property (nonatomic, retain) NSIndexPath *selectedIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initLeftTableView];
    [self initRightTableView];
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadNotification:)
                                                 name:@"点击左边菜单"
                                               object:nil];

    
}

- (void)initData {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dataPlist" ofType:@"plist"];
    _dataList = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    
    _keyArray = [NSMutableArray array];
    for (NSDictionary *dict in _dataList) {
        
        [_keyArray addObject:[dict objectForKey:@"name"]];
        
    }
    
}

- (void)initLeftTableView {
    
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 66, screenWidth/2,screenHeiht-66) style:UITableViewStylePlain];
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.leftTableView.separatorColor = [UIColor colorWithRed:220/255.0f green:220/255.0f blue:220/255.0f alpha:1];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.leftTableView.tableFooterView = [[UIView alloc]init];
  
    [self.view addSubview:self.leftTableView];
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        
        cell.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
;
        
    }
}


- (void)initRightTableView {
    
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(screenWidth/2, 66, screenWidth/2,screenHeiht-66) style:UITableViewStylePlain];
    self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.rightTableView.separatorColor = [UIColor colorWithRed:220/255.0f green:220/255.0f blue:220/255.0f alpha:1];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.rightTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.rightTableView];
    
}

- (void)reloadNotification:(NSNotification *)notification {
    
    NSDictionary *dictionary = [notification userInfo];

    self.index = [dictionary objectForKey:@"index"];
    [self.rightTableView reloadData];
}

//返回有多少个Sections

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.leftTableView) {
        
         return _dataList.count;
    }
    
    if (tableView == self.rightTableView) {
        
        NSDictionary *dict = [_dataList objectAtIndex:[self.index intValue]];
        
        NSArray *array = [dict objectForKey:@"list"];
        return [array count];
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        
        return 44;
    }
    if (tableView == self.rightTableView) {
        
        return 44;
    }
    return 0;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        
        NSString *row = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"点击左边菜单" object:nil  userInfo:@{@"index":row}];
        
        NSArray *array = [tableView visibleCells];
        for (UITableViewCell *cell in array) {
           [cell setAccessoryType:UITableViewCellAccessoryNone];
            cell.textLabel.textColor=[UIColor blackColor];
            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
            self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            self.leftTableView.separatorColor = [UIColor colorWithRed:220/255.0f green:220/255.0f blue:220/255.0f alpha:1];
       
        }
        
        Cell1 *cell=[self.leftTableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *subView = [[UIView alloc]initWithFrame:cell.frame];
        subView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = subView;
        


    }
    
    if (tableView == self.rightTableView) {
        
        NSArray *tmpArray = [tableView visibleCells];
        for (UITableViewCell *cell in tmpArray) {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            cell.textLabel.textColor=[UIColor blackColor];
            
        }
        
        UITableViewCell *cell=[self.rightTableView cellForRowAtIndexPath:indexPath];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

        NSLog(@"indexPath row is %ld",(long)indexPath.row);
        
        NSDictionary *dict = [_dataList objectAtIndex:[self.index intValue]];
        
        NSArray *array = [dict objectForKey:@"list"];
        
        NSString *detailName = [array objectAtIndex:indexPath.row];
        
        NSLog(@"detailName is %@",detailName);
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (tableView == self.leftTableView) {
        
        static NSString * cellIdentifier = @"leftCell";
        
        Cell1* cell = [[Cell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.nameLabel.text = [_keyArray objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
    if (tableView == self.rightTableView) {
        
        static NSString * cellIdentifier = @"rightCell";
        
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSDictionary *dict = [_dataList objectAtIndex:[self.index intValue]];
        
        NSArray *array = [dict objectForKey:@"list"];
        
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        return cell;
        
    }
    
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
