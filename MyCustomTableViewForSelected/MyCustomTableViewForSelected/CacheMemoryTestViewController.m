//
//  CacheMemoryTestViewController.m
//  MyCustomTableViewForSelected
//
//  Created by Zhu Shouyu on 6/2/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CacheMemoryTestViewController.h"


@interface CacheMemoryTestViewController ()
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;
@property (nonatomic, assign) BOOL isDisplay;
@end

@implementation CacheMemoryTestViewController
@synthesize selectedIndexPath = _selectedIndexPath;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isDisplay = NO;
	[self.view setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
        ZSYPopoverListView *listView = [[ZSYPopoverListView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
        listView.titleName.text = @"请选择就诊时间:2016-04-06";
        listView.datasource = self;
        listView.delegate = self;
        [listView setCancelButtonTitle:@"Cancel" block:^{
            NSLog(@"cancel");
       
            [listView removeFromSuperview];
        }];
//        [listView setDoneButtonWithTitle:@"OK" block:^{
//            NSLog(@"Ok%d", [listView indexPathForSelectedRow].row);
//            
//           
//        }];
    
        [listView show];

}

#pragma mark -
- (NSInteger)popoverListView:(ZSYPopoverListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 25;
}

- (UITableViewCell *)popoverListView:(ZSYPopoverListView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusablePopoverCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    if (indexPath.row == 0) {
//        cell.textLabel.text =@"2016-04-06";
//    }
   
    if ( self.selectedIndexPath && NSOrderedSame == [self.selectedIndexPath compare:indexPath])
    {
        cell.imageView.image = [UIImage imageNamed:@"fs_main_login_selected.png"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"fs_main_login_normal.png"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"-dsds---%d------", indexPath.row];
    

    return cell;
}

- (void)popoverListView:(ZSYPopoverListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView popoverCellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"fs_main_login_normal.png"];
    NSLog(@"deselect:%d", indexPath.row);
}

- (void)popoverListView:(ZSYPopoverListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    UITableViewCell *cell = [tableView popoverCellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"fs_main_login_selected.png"];
    NSLog(@"select:%d", indexPath.row);
}
@end
