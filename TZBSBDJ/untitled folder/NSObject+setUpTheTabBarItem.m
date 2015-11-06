//
//  NSObject+setUpTheTabBarItem.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "NSObject+setUpTheTabBarItem.h"
#import "TZTabBarViewModel.h"

@implementation NSObject (setUpTheTabBarItem)

+ (UITabBarItem *)tz_setUpTheTabBarItem:(void (^)(TZTabBarViewModel *))block
{
    TZTabBarViewModel *itemModel = [[TZTabBarViewModel alloc] init];
    
    block(itemModel);
    
    return itemModel.tabBarItem;
}

+ (UITabBarItem *)tz_setUpTheTabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage normalFontOfSize:(UIFont *)fontSize normalForegroundColorAttributeName:(UIColor *)normalColor  selectedForegroundColorAttributeName:(UIColor *)selectedColor
{
    if (fontSize == nil) {
        fontSize = [UIFont systemFontOfSize:15];
    }
    if (normalColor == nil){
        normalColor = [UIColor darkGrayColor];
    }
    if (selectedColor == nil){
        selectedColor = [UIColor yellowColor];
    }
    
    
    return [self tz_setUpTheTabBarItem:^(TZTabBarViewModel *tabBarViewModel) {
        tabBarViewModel.setUpTabBarItemTitle(title).setUpTabBarItemImage(image).setUpTabBarItemSelectedImage(selectedImage).setUpTabBarItemTitleFontOfSize(fontSize).setUpTabBarItemTitleNormalColor(normalColor).setUpTabBarItemTitleSelectedColor(selectedColor);
    }];
}
@end
