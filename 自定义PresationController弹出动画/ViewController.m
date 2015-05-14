//
//  ViewController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "ViewController.h"
#import "XJSecondViewController.h"
#import "XJPresentationController.h"
#import "XJAnimatedTransitioning.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) XJPresentationController *presentationVC;

@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //实现模糊效果
    NSLog(@"hahhaha");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    XJSecondViewController *second = [[XJSecondViewController alloc] init];
    // 设置自定模式
    second.modalPresentationStyle = UIModalPresentationCustom;
    // 设置动效代理
    second.transitioningDelegate = self;
    [self presentViewController:second animated:YES completion:nil];
}


#pragma mark - UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    XJAnimatedTransitioning *transitioning = [[XJAnimatedTransitioning alloc] init];
    transitioning.isPresentation = YES;
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    XJAnimatedTransitioning *transitioning = [[XJAnimatedTransitioning alloc] init];
    transitioning.isPresentation = NO;
    return transitioning;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
//    NSLog(@"%@",[presented class]);
//    NSLog(@"%@",[presenting class]);
    // 只能用这一种创建方式
    self.presentationVC = [[XJPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return self.presentationVC;
}

@end
