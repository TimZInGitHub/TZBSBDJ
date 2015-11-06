//
//  TZTabBarViewModel.h
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TZTabBarViewModel : NSObject

@property (nonatomic, strong) UITabBarItem *tabBarItem;
@property (nonatomic, strong) NSMutableDictionary *normalAttrs;
@property (nonatomic, strong) NSMutableDictionary *selectedAttrs;

- (TZTabBarViewModel *(^)(NSString *))setUpTabBarItemTitle;
- (TZTabBarViewModel *(^)(UIImage *))setUpTabBarItemImage;
- (TZTabBarViewModel *(^)(UIImage *))setUpTabBarItemSelectedImage;
- (TZTabBarViewModel *(^)(UIFont *))setUpTabBarItemTitleFontOfSize;
- (TZTabBarViewModel *(^)(UIColor *))setUpTabBarItemTitleNormalColor;
- (TZTabBarViewModel *(^)(UIColor *))setUpTabBarItemTitleSelectedColor;
- (TZTabBarViewModel *(^)())setUpTabBarItemTitleDefaultAttrs;


@end
