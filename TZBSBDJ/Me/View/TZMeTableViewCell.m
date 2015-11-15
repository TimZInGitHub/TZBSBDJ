//
//  TZMeTableViewCell.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/15/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZMeTableViewCell.h"

@implementation TZMeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.image == nil) {
        return;
    }
    self.imageView.tz_y = TZSmallMargin;
    self.imageView.tz_height = self.contentView.tz_height - 2 * TZSmallMargin;
    self.imageView.tz_width = self.imageView.tz_height;
    
    self.textLabel.tz_x = self.imageView.tz_right + TZMargin;
}

@end
