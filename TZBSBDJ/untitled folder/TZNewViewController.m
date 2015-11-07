//
//  TZNewViewController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZNewViewController.h"
#import "UIBarButtonItem+TZExtension.h"
#import "UINavigationItem+TZExtension.h"

@implementation TZNewViewController

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
