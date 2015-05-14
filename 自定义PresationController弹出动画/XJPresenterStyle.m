//
//  XJPresenterStyle.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/14.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJPresenterStyle.h"
#import "XJPresentationController.h"

@interface XJPresenterStyle ()

@property (strong, nonatomic) XJPresentationController *presentationVC;

@end
@implementation XJPresenterStyle

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    XJAnimatedTransitioning *transitioning = [[XJAnimatedTransitioning alloc] init];
    if (self.animateBlock) {
        transitioning.animateBlock = self.animateBlock;
    }
    transitioning.isPresentation = YES;
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    XJAnimatedTransitioning *transitioning = [[XJAnimatedTransitioning alloc] init];
    if (self.animateBlock) {
        transitioning.animateBlock = self.animateBlock;
    }
    transitioning.isPresentation = NO;
    return transitioning;
}

- (XJPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    // 只能用这一种创建方式
    if (!self.presentationVC) {
        self.presentationVC = [[XJPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    }
    return self.presentationVC;
}

@end
