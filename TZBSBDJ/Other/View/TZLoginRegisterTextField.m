//
//  TZLoginRegisterTextField.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/9.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZLoginRegisterTextField.h"
#import <objc/runtime.h>

@implementation TZLoginRegisterTextField
- (void)awakeFromNib
{
    self.tintColor = [UIColor whiteColor];
    
    self.placeholderColor = [UIColor grayColor];
    
    
#warning 黑魔法runtime
//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
//    for (int i = 0; i < count; i++) {
//        Ivar ivar = ivarList[i];
//        NSLog(@"%s", ivar_getName(ivar));
//    }
//    free(ivarList);
}

- (BOOL)becomeFirstResponder
{
    self.placeholderColor = [UIColor whiteColor];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    self.placeholderColor = [UIColor grayColor];
    return [super resignFirstResponder];
}



@end
