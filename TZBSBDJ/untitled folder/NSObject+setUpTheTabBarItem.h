//
//  NSObject+setUpTheTabBarItem.h
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class TZTabBarViewModel;
@interface NSObject (setUpTheTabBarItem)

+ (UITabBarItem *)tz_setUpTheTabBarItem:(void(^)(TZTabBarViewModel *))block;
//+ (UITabBarItem *)tz_setUpTheTabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
+ (UITabBarItem *)tz_setUpTheTabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage normalFontOfSize:(UIFont *)fontSize normalForegroundColorAttributeName:(UIColor *)normalColor  selectedForegroundColorAttributeName:(UIColor *)selectedColor;
@end
