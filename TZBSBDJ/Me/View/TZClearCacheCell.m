//
//  TZClearCacheCell.m
//  TZBSBDJ
//
//  Created by Tim.Z on 11/17/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZClearCacheCell.h"
#import "SDImageCache.h"
#import "SVProgressHUD.h"
 
#define TZCustomCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]

@implementation TZClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        
        self.userInteractionEnabled = NO;
        
        __weak typeof(self) weakSelf = self;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            [NSThread sleepForTimeInterval:2];
            
            unsigned long long size = TZCustomCacheFile.fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            
            if (weakSelf == nil) {
                return ;
            }
            NSString *sizeText = nil;
            if (size >= pow(10, 9)) { // size >= 1GB
                sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
            } else if (size >= pow(10, 6)) { // 1GB > size >= 1MB
                sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
            } else if (size >= pow(10, 3)) { // 1MB > size >= 1KB
                sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
            } else { // 1KB > size
                sizeText = [NSString stringWithFormat:@"%zdB", size];
            }
            
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", sizeText];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.textLabel.text = text;
                weakSelf.accessoryView = nil;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(clearCache)]];
                
                weakSelf.userInteractionEnabled = YES;
            });

        });

    }
    return self;
}

- (void)clearCache
{
    [SVProgressHUD showWithStatus:@"正在清除缓存..." maskType:SVProgressHUDMaskTypeBlack];
    
    [[SDImageCache sharedImageCache] cleanDiskWithCompletionBlock:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:TZCustomCacheFile error:nil];
            [mgr createDirectoryAtPath:TZCustomCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                
                self.textLabel.text = @"清除缓存(0B)";
            });
        });
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];
}




@end
