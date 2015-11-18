//
//  TZTitleButton.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/18/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZTitleButton.h"

@implementation TZTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
