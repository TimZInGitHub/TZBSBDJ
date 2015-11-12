//
//  TZLoginRegisterViewController.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/8.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZLoginRegisterViewController.h"
#import "TZLoginRegister2ViewController.h"

@interface TZLoginRegisterViewController ()

@end

@implementation TZLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)loginRegister
{

    [self dismissViewControllerAnimated:NO completion:nil];
    TZLoginRegister2ViewController *loginR2VC = [[TZLoginRegister2ViewController alloc] init];
    [self.delegate presentViewController:loginR2VC animated:NO completion:nil];
    
}





@end
