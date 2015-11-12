//
//  TZMainTabBarController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZMainTabBarController.h"
#import "TZFollowViewController.h"
#import "TZEssenceViewController.h"
#import "TZNewViewController.h"
#import "TZMeViewController.h"
#import "TZNavigationController.h"
#import "TZTabBar.h"
#import "TZLoginRegisterViewController.h"




@interface TZMainTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, getter=isLoggedIn) BOOL loggedIn;

@end

@implementation TZMainTabBarController

#pragma mark - lazylodaing



#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.delegate = self;
    
    [self setUpItemTitleAttributes];
    [self setUpChildViewController];
    [self setUpTabBar];
#warning change
    self.loggedIn = NO;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
#warning 尽量不要把自己的代理设置成自己
    self.delegate = self;
}

#pragma mark - setup
- (void)setUpTabBar
{
    [self setValue:[[TZTabBar alloc] init] forKey:@"tabBar"];
}

- (void)setUpItemTitleAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
#warning 如何改selected的字体大小?
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 *  配置每一个子控制器的tabBarItem
 */
- (void)setUpChildViewController
{
    TZEssenceViewController *essenceVC = [[TZEssenceViewController alloc] init];
    TZNavigationController *essenceNC = [[TZNavigationController alloc] initWithRootViewController:essenceVC];
    essenceNC.tabBarItem.tzTitle(@"Essence").tzImage([UIImage imageNamed:@"tabBar_essence_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_essence_click_icon"]);
    [self addChildViewController:essenceNC];
    
    TZNewViewController *newVC = [[TZNewViewController alloc] init];
    TZNavigationController *newNC = [[TZNavigationController alloc] initWithRootViewController:newVC];
    newNC.tabBarItem.tzTitle(@"New").tzImage([UIImage imageNamed:@"tabBar_new_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_new_click_icon"]);
    [self addChildViewController:newNC];
    
    TZFollowViewController *FollowVC = [[TZFollowViewController alloc] init];
    TZNavigationController *followNC = [[TZNavigationController alloc] initWithRootViewController:FollowVC];
    followNC.tabBarItem.tzTitle(@"Follow").tzImage([UIImage imageNamed:@"tabBar_friendTrends_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_friendTrends_click_icon"]);
    [self addChildViewController:followNC];
    
    TZMeViewController *meVC = [[TZMeViewController alloc] init];
    TZNavigationController *meNC = [[TZNavigationController alloc] initWithRootViewController:meVC];
    meNC.tabBarItem.tzTitle(@"Me").tzImage([UIImage imageNamed:@"tabBar_me_icon"]).tzSelectedImage([UIImage imageNamed:@"tabBar_me_click_icon"]);
    [self addChildViewController:meNC];
    
    TZFUNC
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    if (self.isLoggedIn == NO) {
        if ([viewController.childViewControllers[0] isKindOfClass:[TZFollowViewController class]] || [viewController.childViewControllers[0] isKindOfClass:[TZMeViewController class]]) {
            
            NSLog(@"%lu",tabBarController.selectedIndex);
            TZFUNC
            TZLoginRegisterViewController *loginRVC = [[TZLoginRegisterViewController alloc] init];
            loginRVC.delegate = self;
            loginRVC.view.backgroundColor = TZCommonBackgroundColor;
            [self presentViewController:loginRVC animated:YES completion:nil];
#warning 注意先后顺序
            [tabBarController setSelectedIndex:0];
            }
    }

}




@end
