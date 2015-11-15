//
//  TZMeSquareButton.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/15/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZMeSquareButton.h"
#import "TZMeSquare.h"
#import "UIButton+WebCache.h"

@implementation TZMeSquareButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.tz_y = self.tz_height * 0.15;
    self.imageView.tz_height = self.tz_height * 0.5;
    self.imageView.tz_width = self.imageView.tz_height;
    self.imageView.tz_centerX = self.tz_width * 0.5;
    
    self.titleLabel.tz_x = 0;
    self.titleLabel.tz_y = self.imageView.tz_bottom;
    self.titleLabel.tz_width = self.tz_width;
    self.titleLabel.tz_height = self.tz_height - self.titleLabel.tz_y;
}

- (void)setSquare:(TZMeSquare *)square
{
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}


@end
