//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by WuYongmin on 16/6/30.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"
#define _CELL @ "acell"

@interface ViewController ()< UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initCollectionView];
}
- ( void )initCollectionView {
    //先实例化一个层
    UICollectionViewFlowLayout *layout=[[ UICollectionViewFlowLayout alloc ] init];
    
    //创建一屏的视图大小
    
    UICollectionView *collectionView=[[ UICollectionView alloc]initWithFrame :self.view. bounds collectionViewLayout :layout];
    
    [collectionView registerClass :[UICollectionViewCell class] forCellWithReuseIdentifier : _CELL ];
    collectionView.backgroundColor =[ UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview :collectionView];
    
}

#pragma mark --UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数

- (NSInteger )collectionView:( UICollectionView *)collectionView numberOfItemsInSection:( NSInteger )section {
    
    return 31;
}

//定义展示的Section的个数

-( NSInteger )numberOfSectionsInCollectionView:( UICollectionView *)collectionView {
    
    return 1;
}

//每个UICollectionView展示的内容

-( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier : _CELL forIndexPath :indexPath];

//    cell. backgroundColor = [ UIColor colorWithRed :(( arc4random ()% 255 )/ 255.0 ) green :(( arc4random ()% 255 )/ 255.0 ) blue :(( arc4random ()% 255 )/ 255.0 ) alpha : 1.0f ];
    
    cell. backgroundColor = [UIColor redColor];
    return cell;
    
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath

{
//    
   UICollectionViewCell * cell = ( UICollectionViewCell *)[collectionView cellForItemAtIndexPath :indexPath];

    NSLog(@"index is %d",indexPath.row);
    UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];
    selectedBGView.backgroundColor = [UIColor blueColor];
    cell.selectedBackgroundView = selectedBGView;

}
// cell点击变色
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//返回这个UICollectionViewCell是否可以被选择

-( BOOL )collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath {
    return YES ;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个UICollectionView 的大小

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath {
    return CGSizeMake ( 90 , 90 );
}

//定义每个UICollectionView 的边距

-( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section {
    return UIEdgeInsetsMake ( 10 , 10 , 10 , 10 );
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
