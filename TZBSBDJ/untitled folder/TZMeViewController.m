//
//  TZMeViewController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZMeViewController.h"
#import "TZSettingViewController.h"

@interface TZMeViewController ()

@end

@implementation TZMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    
    self.navigationItem.tzTitle(@"Me").tzRightBarButtonItems(@[[UIBarButtonItem tz_initWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)],[UIBarButtonItem tz_initWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)]]);
}

- (void)settingClick
{
    TZFUNC
    
    TZSettingViewController *settingVC = [[TZSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)moonClick
{
    TZFUNC
}


@end
