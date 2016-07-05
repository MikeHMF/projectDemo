//
//  ViewController.m
//  XMLDemo
//
//  Created by WuYongmin on 16/7/5.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

#define screenWidth [[UIScreen mainScreen]bounds].size.width    //屏幕宽度
#define screenHeiht [[UIScreen mainScreen]bounds].size.height   //屏幕高度
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSMutableArray array];
    
    [self setupRequest];
  [self initTableView];
}

- (void)initTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, screenWidth, screenHeiht-66)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_array count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 46;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"cell";
    
    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    return cell;
    
}

//文档开始的时候触发
- (void)parserDidStartDocument:(NSXMLParser *)parser
{

}

//文档出错的时候触发
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"%@",parseError);
}

//遇到一个开始标签时候触发
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    _currentTagName = elementName;
    
}

//遇到字符串时候触发
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //替换回车符和空格
    string =[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([string isEqualToString:@""]) {
        return;
    }

    if ([_currentTagName isEqualToString:@"string"]) {
        [_array addObject:string];
    }
    [self.tableView reloadData];
    
}

//遇到结束标签时候出发
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName;
{

}


//遇到文档结束时候触发
- (void)parserDidEndDocument:(NSXMLParser *)parser
{

    [self.tableView reloadData];
}


- (void)setupRequest {
    
    NSString *urlString =@"http://ws.webxml.com.cn/WebServices/WeatherWS.asmx/getRegionProvince?";
    // 初始化一个NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    // 设置请求方法，可以省略，默认就是GET请求
    request.HTTPMethod = @"GET";
    // 如果60秒过后服务器还没有相应，就算请求超时
    request.timeoutInterval = 360;
    // 初始化一个连接
    self.informationMenuConn = [NSURLConnection connectionWithRequest:request delegate:self];
    // 开始一个异步请求
    [self.informationMenuConn start];
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    if (self.informationMenuConn==connection) {
        
        self.receiveDataInformationList = [NSMutableData data];
    }
}

#pragma mark - 接收到服务器返回的数据时调用（如果数据比较多，这个方法可能会被调用多次）

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    // 拼接数据
    if(self.informationMenuConn==connection) {
        
        [self.receiveDataInformationList appendData:data];
    }
}

#pragma mark - 网络连接出错时调用

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSLog(@"网络连接出错:%@", [error localizedDescription]);
}


#pragma mark - 服务器的数据已经接收完毕时调用

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //开始解析XML
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.receiveDataInformationList];
    parser.delegate = self;
    [parser parse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
