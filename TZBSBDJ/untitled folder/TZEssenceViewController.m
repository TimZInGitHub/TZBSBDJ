//
//  TZEssenceViewController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZEssenceViewController.h"
#import "UINavigationItem+TZExtension.h"
#include "UIBarButtonItem+TZExtension.h"

#import <objc/runtime.h>


@implementation TZEssenceViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    
    self.navigationItem.tzTitleView([[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]]).tzLeftBarButtonItem([UIBarButtonItem tz_initWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)]);
}

- (void)tagClick{
    TZFUNC
}

@end
