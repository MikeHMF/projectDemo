//
//  JXUIView+Touch.m
//  UIView+Chick
//
//  Created by ZhuJX on 16/5/13.
//  Copyright © 2016年 ZhuJX. All rights reserved.
//

#import "JXUIView+Touch.h"
@implementation UIView(JXTouch)
static char touchKey;
-(void)actionTap{
    void (^block)(void) = objc_getAssociatedObject(self, &touchKey);
    if (block) block();
}
-(void)addJXTouch:(TouchBlock)block{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &touchKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end