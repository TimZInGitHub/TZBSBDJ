//
//  TZTabBarViewModel.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZTabBarViewModel.h"

@implementation TZTabBarViewModel

#pragma mark - lazyloading

- (UITabBarItem *)tabBarItem
{
    if (!_tabBarItem) {
        _tabBarItem = [[UITabBarItem alloc] init];
    }
    return _tabBarItem;
}

- (NSMutableDictionary *)normalAttrs
{
    if (!_normalAttrs) {
        _normalAttrs = [NSMutableDictionary dictionary];
    }
    return _normalAttrs;
}

- (NSMutableDictionary *)selectedAttrs
{
    if (!_selectedAttrs) {
        _selectedAttrs = [NSMutableDictionary dictionary];
    }
    return _selectedAttrs;
}

#pragma mark - setUp the Property

- (TZTabBarViewModel *(^)(UIImage *))setUpTabBarItemImage
{
    return ^(UIImage *image){
        self.tabBarItem.image = image;
        
        return self;
    };
}

- (TZTabBarViewModel *(^)(UIImage *))setUpTabBarItemSelectedImage
{
    return ^(UIImage *selectedImage){
        self.tabBarItem.selectedImage = selectedImage;
        
        return self;
    };
}


- (TZTabBarViewModel *(^)(NSString *))setUpTabBarItemTitle
{
    return ^(NSString *title){
        self.tabBarItem.title = title;
        
        return self;
    };
}

- (TZTabBarViewModel *(^)(UIFont *))setUpTabBarItemTitleFontOfSize
{
    
    return ^(UIFont *normalAttrsSize){
        self.normalAttrs[NSFontAttributeName] = normalAttrsSize;
        [self.tabBarItem setTitleTextAttributes:self.normalAttrs forState:UIControlStateNormal];
        
        return self;
    };
}

- (TZTabBarViewModel *(^)(UIColor *))setUpTabBarItemTitleNormalColor
{
    
    return ^(UIColor *normalAttrsColor){
        self.normalAttrs[NSForegroundColorAttributeName] = normalAttrsColor;
        [self.tabBarItem setTitleTextAttributes:self.normalAttrs forState:UIControlStateNormal];
        
        return self;
    };
}

- (TZTabBarViewModel *(^)(UIColor *))setUpTabBarItemTitleSelectedColor
{
    
    return ^(UIColor *selectedAttrsColor){
        self.selectedAttrs[NSForegroundColorAttributeName] = selectedAttrsColor;
        [self.tabBarItem setTitleTextAttributes:self.selectedAttrs forState:UIControlStateSelected];
        
        return self;
    };
}

- (TZTabBarViewModel *(^)())setUpTabBarItemTitleDefaultAttrs
{
    
    return ^(){
        self.selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
        self.normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        self.normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
        [self.tabBarItem setTitleTextAttributes:self.normalAttrs forState:UIControlStateNormal];
        [self.tabBarItem setTitleTextAttributes:self.selectedAttrs forState:UIControlStateSelected];
        
        return self;
    };
}



@end
