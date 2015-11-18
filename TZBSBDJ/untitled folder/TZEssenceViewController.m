//
//  TZEssenceViewController.m
//  ZYH-百思不得姐001
//
//  Created by Tim.Z on 15/11/5.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZEssenceViewController.h"
#import "TZAllViewController.h"
#import "TZVideoViewController.h"
#import "TZVoiceViewController.h"
#import "TZPictureViewController.h"
#import "TZWordViewController.h"
#import "TZTitleButton.h"

@interface TZEssenceViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) TZTitleButton *selectedTitleButton;
@property (nonatomic, weak) UIView *indicatorView;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIView *titlesView;


@end


@implementation TZEssenceViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    
    [self setNav];
    [self setChildViewC];
    [self setScrollV];
    [self setTitleV];
    
    [self addChileVCView];
}

- (void)setChildViewC
{
    TZAllViewController *all = [[TZAllViewController alloc] init];
    [self addChildViewController:all];
    
    TZVideoViewController *video = [[TZVideoViewController alloc] init];
    [self addChildViewController:video];
    
    TZVoiceViewController *voice = [[TZVoiceViewController alloc] init];
    [self addChildViewController:voice];
    
    TZPictureViewController *picture = [[TZPictureViewController alloc] init];
    [self addChildViewController:picture];
    
    TZWordViewController *word = [[TZWordViewController alloc] init];
    [self addChildViewController:word];
}

- (void)setScrollV
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = TZCommonBackgroundColor;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.tz_width, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)setTitleV
{
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titleView.frame = CGRectMake(0, 64, self.view.tz_width, 35);
    [self.view addSubview:titleView];
    self.titlesView = titleView;
    
    NSArray *titles = @[@"All", @"Video", @"Voice", @"Picture", @"Word"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titleView.tz_width / count;
    CGFloat titleButtonH = titleView.tz_height;
    
    for (NSUInteger i = 0; i < count; ++i) {
        TZTitleButton *titleButton = [TZTitleButton buttonWithType:UIButtonTypeCustom];
#warning !
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        titleButton.frame = CGRectMake(i *titleButtonW, 0, titleButtonW, titleButtonH);
    }
    
    TZTitleButton *firstTitleButton = titleView.subviews.firstObject;
    [firstTitleButton.titleLabel sizeToFit];
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.tz_height = 1;
    indicatorView.tz_y = titleView.tz_height - indicatorView.tz_height;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    indicatorView.tz_width = firstTitleButton.titleLabel.tz_width;
    indicatorView.tz_centerX = firstTitleButton.tz_centerX;

}

- (void)setNav
{
    self.navigationItem.tzTitleView([[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]]).tzLeftBarButtonItem([UIBarButtonItem tz_initWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)]);
}

- (void)titleButtonClick:(TZTitleButton *)titleButton
{
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.tz_width = titleButton.titleLabel.tz_width;
        self.indicatorView.tz_centerX = titleButton.tz_centerX;
    }];
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.tz_width;
    [self.scrollView setContentOffset:offset animated:YES];
    TZLog(@"%zd",titleButton.tag);
}

- (void)addChileVCView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.tz_width;
    
    UIViewController *childVC = self.childViewControllers[index];
    
    if ([childVC isViewLoaded]) {
        return;
    }
    
    childVC.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVC.view];
    TZFUNC
}


- (void)tagClick{
    TZFUNC
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChileVCView];
    TZFUNC
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSUInteger index = scrollView.contentOffset.x / scrollView.tz_width;
    TZTitleButton *titleButton = self.titlesView.subviews[index];
    [self titleButtonClick:titleButton];
    

    [self addChileVCView];
    
    TZFUNC
}

@end
