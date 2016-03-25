//
//  ViewController.h
//  coreDatademo
//
//  Created by WuYongmin on 16/3/11.
//  Copyright © 2016年 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "MenuFindDoctorModel.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

