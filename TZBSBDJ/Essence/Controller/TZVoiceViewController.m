//
//  TZVoiceViewController.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/18/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZVoiceViewController.h"

@interface TZVoiceViewController ()

@end

@implementation TZVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TZFUNC
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = TZRandomColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", [self class], indexPath.row];
    return cell;
}

@end
