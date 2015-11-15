//
//  TZMeViewController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZMeViewController.h"
#import "TZSettingViewController.h"
#import "TZMeFootView.h"
#import "TZMeTableViewCell.h"

@interface TZMeViewController ()

@end

@implementation TZMeViewController

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTable];
    
    [self setupNav];
}

- (void)setupTable
{
    self.tableView.backgroundColor =  TZCommonBackgroundColor;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = TZMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(TZMargin - 35, 0, 0, 0);
    
    self.tableView.tableFooterView = [[TZMeFootView alloc] init];
}

- (void)setupNav
{
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

#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"BSBDJ";
    
    TZMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[TZMeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"LogIn/SignUp";
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
    }else{
        cell.textLabel.text = @"OfflineDownload";
        cell.imageView.image = nil;
    }
    
    return cell;
}




@end
