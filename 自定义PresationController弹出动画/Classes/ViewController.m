//
//  ViewController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "ViewController.h"
#import "XJSecondViewController.h"
#import "CustomNavigationController.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实现模糊效果
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    XJSecondViewController *second = [[XJSecondViewController alloc] init];
    
#pragma no navigation
//    CustomNavigationController *nav = [[CustomNavigationController alloc] initWithRootViewController:second];
    second.title = @"34r";
    [self presentViewController:second animated:YES completion:nil];
}
@end
