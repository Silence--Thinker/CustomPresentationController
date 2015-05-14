//
//  XJSecondViewController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJSecondViewController.h"
#import "XJThirdViewController.h"
@interface XJSecondViewController ()

@end
@implementation XJSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickBtn:(UIButton *)sender
{
    XJThirdViewController *third =  [[XJThirdViewController alloc] init];
    [self presentViewController:third animated:YES completion:nil];
}

@end
