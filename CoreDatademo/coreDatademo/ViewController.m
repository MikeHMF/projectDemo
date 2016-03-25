//
//  ViewController.m
//  coreDatademo
//
//  Created by WuYongmin on 16/3/11.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Create Entity
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MenuFindDoctorModel" inManagedObjectContext:self.managedObjectContext];
    
    
    // Initialize Record
    NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    [record setValue:@"3333" forKey:@"account"];
      NSError *error1 = nil;
    
    if ([self.managedObjectContext save:&error1]) {
        // Dismiss View Controller
          NSLog(@"保存成功");
        
    }else {
        if (error1) {
            NSLog(@"Unable to save record.");
            NSLog(@"%@, %@", error1, error1.localizedDescription);
        }
        
    }
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MenuFindDoctorModel"];
    
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    for (int  i=0; i<result.count; i++) {

        MenuFindDoctorModel *people = [result objectAtIndex:i];
        
        NSLog(@"people name is %@",people.account);
    }
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
