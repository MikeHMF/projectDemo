//
//  JXUIView+Touch.h
//  UIView+Chick
//
//  Created by ZhuJX on 16/5/13.
//  Copyright © 2016年 ZhuJX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIView(JXTouch)
typedef void (^TouchBlock)();
-(void)addJXTouch:(TouchBlock)block;
@end