//
//  TZSettingViewController.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/7.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZSettingViewController.h"
#import "TZClearCacheCell.h"
#import "TZOtherCell.h"
#import "SDImageCache.h"


@interface TZSettingViewController ()

@end

@implementation TZSettingViewController

static NSString * const TZClearCacheCellId = @"TZClearCacheCell";
static NSString * const TZSettingCellId = @"TZSettingCell";
static NSString * const TZOtherCellId = @"TZOtherCell";

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    self.navigationItem.tzTitle(@"Settings");
    
    [self.tableView registerClass:[TZClearCacheCell class] forCellReuseIdentifier:TZClearCacheCellId];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TZSettingCellId];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TZOtherCell class]) bundle:nil] forCellReuseIdentifier:TZOtherCellId];
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 10;
    if (section == 1) return 5;
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return [tableView dequeueReusableCellWithIdentifier:TZClearCacheCellId];
    } else if (indexPath.row == 2){
        return [tableView dequeueReusableCellWithIdentifier:TZOtherCellId];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TZSettingCellId];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd - %zd", indexPath.section, indexPath.row];
    return cell;
}

#pragma -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}












@end
