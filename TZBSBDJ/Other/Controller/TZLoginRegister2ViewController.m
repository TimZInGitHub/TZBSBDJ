//
//  TZLoginRegister2ViewController.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/8.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZLoginRegister2ViewController.h"

@interface TZLoginRegister2ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation TZLoginRegister2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showLoginOrRegister:(UIButton *)sender
{
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) {
        self.leftMargin.constant = 0;
        sender.selected = NO;
    }else {
        self.leftMargin.constant = - self.view.tz_width;
        sender.selected = YES;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
