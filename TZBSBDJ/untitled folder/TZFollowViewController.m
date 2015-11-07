//
//  TZFollowViewController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZFollowViewController.h"
#import "UINavigationItem+TZExtension.h"
#include "UIBarButtonItem+TZExtension.h"
#import "TZRecommendFollowViewController.h"

@interface TZFollowViewController ()



@end

@implementation TZFollowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    
    self.navigationItem.tzTitle(@"MyFollow").tzLeftBarButtonItem([UIBarButtonItem tz_initWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(followClick)]);

}

- (void)followClick
{
    TZFUNC
    
    TZRecommendFollowViewController *recommendFVC = [[TZRecommendFollowViewController alloc] init];
    [self.navigationController pushViewController:recommendFVC animated:YES];
    
}

@end
