//
//  cell.m
//  ScrollMenu
//
//  Created by WuYongmin on 16/5/5.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "Cell1.h"

@implementation Cell1

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //头像
        self.avatorImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(10,5,36,36)];
        self.avatorImageView.layer.cornerRadius = 18;
        self.avatorImageView.layer.masksToBounds = YES;
        self.avatorImageView.image = [UIImage imageNamed:@"but_map.png"];
        
        //姓名
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.avatorImageView.frame.origin.x+self.avatorImageView.frame.size.width+5, 10, 100, 20)];
        self.nameLabel.font = [UIFont systemFontOfSize:14];
        self.nameLabel.numberOfLines = 1;

        [self.contentView addSubview: self.avatorImageView];
        [self.contentView addSubview: self.nameLabel];
  
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
