//
//  TZTabBar.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZTabBar.h"
#import "UIView+TZCoordinateExtension.h"


@interface TZTabBar ()

@property (nonatomic, weak) UIButton *publishButton;

@end

@implementation TZTabBar

#pragma mark - lazyloading
- (UIButton *)publishButton
{
    if (_publishButton == nil) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [_publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_publishButton];
    }
    return _publishButton;
}

#pragma mark - initialization
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.tz_width / 5;
    CGFloat buttonH = self.tz_height;
    
    CGFloat tabBarButtonY = 0;
    
    int taBarButtonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
    }
}

#pragma mark - click
- (void)publishClick
{
    TZFUNC
}

@end


