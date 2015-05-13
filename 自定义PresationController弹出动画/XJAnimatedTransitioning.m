//
//  XJAnimatedTransitioning.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJAnimatedTransitioning.h"
#import "UIView+XJ.h"
@implementation XJAnimatedTransitioning


#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
// 过渡动画的实现
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *animateView = self.isPresentation ? toView : fromView;
    UIViewController *animateViewController = self.isPresentation ? toViewController : fromViewController;
    
    UIView *containerView = [transitionContext containerView];
    CGRect fromRect = fromView.frame;
    if (self.isPresentation) {
        animateView.y = - animateView.height;
    }
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:200.0 initialSpringVelocity:2.0 options: UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
         animateView.y = self.isPresentation ? 0 : -animateView.height;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
@end
