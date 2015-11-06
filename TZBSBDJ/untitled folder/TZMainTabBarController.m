//
//  TZMainTabBarController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZMainTabBarController.h"
#import "TZFriendTrendsViewController.h"
#import "TZEssenceViewController.h"
#import "TZNewViewController.h"
#import "TZMeViewController.h"

#import "TZTabBarViewModel.h"
#import "NSObject+setUpTheTabBarItem.h"

@interface TZMainTabBarController ()

@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation TZMainTabBarController

#pragma mark - lazylodaing
- (UITabBarItem *)publishButton
{
    if (_publishButton == nil) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
                [publishButton addTarget:self action:@selector(clickPublishButton) forControlEvents:UIControlEventTouchUpInside];
        _publishButton = publishButton;
    }
    return _publishButton;
}


#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self setUpChildViewController];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tabBar addSubview:self.publishButton];
    self.publishButton.frame = CGRectMake(0, 0, self.tabBar.frame.size.width / 5, self.tabBar.frame.size.height);
    self.publishButton.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    

}
/**
 *  配置每一个子控制器的tabBarItem
 */
- (void)setUpChildViewController
{
//    UITabBarItem *item = [UITabBarItem appearance];
//    
//    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
//    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
//    normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
//    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
//    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
////    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
//#warning 如何改selected的字体大小?
//    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
//    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    TZFriendTrendsViewController *friendTrendsVC = [[TZFriendTrendsViewController alloc] init];
    friendTrendsVC.tabBarItem = [NSObject tz_setUpTheTabBarItem:^(TZTabBarViewModel *tabBarViewModel) {
        tabBarViewModel.setUpTabBarItemTitle(@"FriendTrends").setUpTabBarItemImage([UIImage imageNamed:@"tabBar_friendTrends_icon"]).setUpTabBarItemSelectedImage([UIImage imageNamed:@"tabBar_friendTrends_click_icon"]).setUpTabBarItemTitleDefaultAttrs();
    }];
    [self addChildViewController:friendTrendsVC];
    
    TZEssenceViewController *essenceVC = [[TZEssenceViewController alloc] init];
    essenceVC.tabBarItem = [NSObject tz_setUpTheTabBarItem:^(TZTabBarViewModel *tabBarViewModel) {
        tabBarViewModel.setUpTabBarItemTitle(@"Essence").setUpTabBarItemImage([UIImage imageNamed:@"tabBar_essence_icon"]).setUpTabBarItemSelectedImage([UIImage imageNamed:@"tabBar_essence_click_icon"]).setUpTabBarItemTitleDefaultAttrs();
    }];

    [self addChildViewController:essenceVC];
    
    UIViewController *tempVC = [[UIViewController alloc] init];
    

    [self addChildViewController:tempVC];

    
    TZNewViewController *newVC = [[TZNewViewController alloc] init];
    newVC.tabBarItem = [NSObject tz_setUpTheTabBarItem:^(TZTabBarViewModel *tabBarViewModel) {
        tabBarViewModel.setUpTabBarItemTitle(@"New").setUpTabBarItemImage([UIImage imageNamed:@"tabBar_new_icon"]).setUpTabBarItemSelectedImage([UIImage imageNamed:@"tabBar_new_click_icon"]).setUpTabBarItemTitleDefaultAttrs();
    }];

    [self addChildViewController:newVC];
    
    TZMeViewController *meVC = [[TZMeViewController alloc] init];
    meVC.tabBarItem = [NSObject tz_setUpTheTabBarItem:^(TZTabBarViewModel *tabBarViewModel) {
        tabBarViewModel.setUpTabBarItemTitle(@"Me").setUpTabBarItemImage([UIImage imageNamed:@"tabBar_me_icon"]).setUpTabBarItemSelectedImage([UIImage imageNamed:@"tabBar_me_click_icon"]).setUpTabBarItemTitleDefaultAttrs();
    }];

    [self addChildViewController:meVC];
}



- (void)clickPublishButton
{
    TZFUNC;


}



@end
