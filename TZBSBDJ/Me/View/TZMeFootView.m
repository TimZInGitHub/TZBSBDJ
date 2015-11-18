//
//  TZMeFootView.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/15/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZMeFootView.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import <SafariServices/SafariServices.h>
#import "TZMeSquareButton.h"
#import "TZMeSquare.h"


@implementation TZMeFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
            NSArray *squares = [TZMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self createSquares:squares];
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            TZLog(@"请求失败- %@",error);
        }];
    }
    return self;
}

- (void)createSquares:(NSArray *)squares
{
    NSUInteger count = squares.count;
    
    NSUInteger maxColsCout = 4;
    CGFloat buttonW = self.tz_width / maxColsCout;
    CGFloat buttonH = buttonW;
    
    for (NSUInteger i = 0; i < count; ++i) {
        TZMeSquareButton *button = [TZMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        button.tz_x = (i % maxColsCout) * buttonW;
        button.tz_y = (i / maxColsCout) * buttonH;
        button.tz_width = buttonW;
        button.tz_height = buttonH;
        
        button.square = squares[i];
    }
    
    self.tz_height = self.subviews.lastObject.tz_bottom;
    
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData];
    
    
}

- (void)buttonClick:(TZMeSquareButton *)button
{
    TZFUNC
    NSString *url = button.square.url;
    
    if ([url hasPrefix:@"http"]) {
        
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
        UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
        [tabBarVC presentViewController:webView animated:YES completion:nil];
    }else if ([url hasPrefix:@"mod"]){
        if ([url hasSuffix:@"BDJ_To_Check"]) {
            TZLog(@"跳转到[审帖]界面");
        } else if ([url hasSuffix:@"BDJ_To_RecentHot"]) {
            TZLog(@"跳转到[每日排行]界面");
        } else {
            TZLog(@"跳转到其他界面");
        }
    } else {
        TZLog(@"不是http或者mod协议的");
    }
}





@end
