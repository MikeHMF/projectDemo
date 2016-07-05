//
//  ViewController.h
//  XMLDemo
//
//  Created by WuYongmin on 16/7/5.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate,NSURLConnectionDelegate>

//解析出的数据内部是字典类型
@property (strong,nonatomic) NSMutableArray *notes;
//当前标签的名字
@property (strong,nonatomic) NSString *currentTagName;

@property (nonatomic, strong) NSURLConnection *informationMenuConn;//请求菜单列表
@property (nonatomic, strong) NSMutableData *receiveDataInformationList;//服务器返回的information列表数据

- (void)setupRequest;
@property (nonatomic,strong)  UITableView *tableView;

@end

