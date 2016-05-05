//
//  cell.h
//  ScrollMenu
//
//  Created by WuYongmin on 16/5/5.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define screenWidth [[UIScreen mainScreen]bounds].size.width    //屏幕宽度
@interface Cell1 : UITableViewCell

@property (nonatomic,retain) UILabel *nameLabel;//姓名
@property (nonatomic,retain) UIImageView *avatorImageView;//头像

@end
