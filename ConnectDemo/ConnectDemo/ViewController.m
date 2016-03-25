//
//  ViewController.m
//  ConnectDemo
//
//  Created by ChenBinbin on 16/3/25.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"通讯录";
    
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        
        if (granted) {
            //查询所有
            NSLog(@"查询所有");
            [self filterContentForSearchText:@""];
        }
        
    });
    
    CFRelease(addressBook);
}

- (void)filterContentForSearchText:(NSString*)searchText {
    //如果没有授权则退出
    if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) {
        return ;
    }
    
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    
    //查询所有
    self.listContacts = CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(addressBook));
    
    [self.tableView reloadData];
    
    CFRelease(addressBook);
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"count is %d",[self.listContacts count]);
    
    return [self.listContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    NSLog(@"[self.listContacts objectAtIndex:[indexPath row]] is %@",[self.listContacts objectAtIndex:[indexPath row]]);
    ABRecordRef thisPerson = CFBridgingRetain([self.listContacts objectAtIndex:[indexPath row]]);
    
    NSString *firstName = CFBridgingRelease(ABRecordCopyValue(thisPerson, kABPersonFirstNameProperty));
    firstName = firstName != nil?firstName:@"";
    NSString *lastName =  CFBridgingRelease(ABRecordCopyValue(thisPerson, kABPersonLastNameProperty));
    lastName = lastName != nil?lastName:@"";
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",firstName,lastName];
    NSString* name = CFBridgingRelease(ABRecordCopyCompositeName(thisPerson));
    cell.textLabel.text = name;
    
    
    
    

    ABRecordID personID = ABRecordGetRecordID(thisPerson);
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    ABRecordRef person = ABAddressBookGetPersonWithRecordID(addressBook, personID);
    
    
    //取得电话号码属性
    ABMultiValueRef phoneNumberProperty = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSArray* phoneNumberArray = CFBridgingRelease(ABMultiValueCopyArrayOfAllValues(phoneNumberProperty));

      for(int index = 0; index< [phoneNumberArray count]; index++){
          
            NSString *phoneNumber = [phoneNumberArray objectAtIndex:index++];
            NSString *phoneNumberLabel = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phoneNumberProperty, index));
            
            if ([phoneNumberLabel isEqualToString:(NSString*)kABPersonPhoneMobileLabel]) {
                cell.detailTextLabel.text = phoneNumber;
            } else if ([phoneNumberLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel]) {
                cell.detailTextLabel.text = phoneNumber;
            } else {
                NSLog(@"%@: %@", @"其它电话", phoneNumber);
            }
      }
    
    CFRelease(thisPerson);
    CFRelease(phoneNumberProperty);
    CFRelease(addressBook);
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
