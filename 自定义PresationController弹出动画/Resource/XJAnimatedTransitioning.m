//
//  XJAnimatedTransitioning.m
//  CustomPresationController
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJAnimatedTransitioning.h"
#import "UIView+XJ.h"

NSTimeInterval const  kAnimatedTimeInterval = 0.5;

@implementation XJAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return _animationDuration ? _animationDuration : kAnimatedTimeInterval;
}

// 过渡动画的实现
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    if (self.animateBlock) {
        self.animateBlock(transitionContext, self.isPresentation);
        return;
    }
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *animateView = self.isPresentation ? toView : fromView;
    UIViewController *animateViewController = self.isPresentation ? toViewController : fromViewController;
    
    CGRect onScreenFrame = [transitionContext finalFrameForViewController:animateViewController];
    CGRect offScreenFrame = CGRectOffset(onScreenFrame, 0, onScreenFrame.size.height);
    
    CGRect initialFrame = self.isPresentation ? offScreenFrame : onScreenFrame;
    CGRect finalFrame = self.isPresentation ? onScreenFrame : offScreenFrame;
    animateView.frame = initialFrame;
//    animateView.frame = CGRectInset(finalFrame, finalFrame.size.width/2, finalFrame.size.height/2);
    animateView.frame = onScreenFrame;
    animateView.alpha = self.isPresentation ? 0 : 1;
    
    [UIView transitionWithView:animateView duration:kAnimatedTimeInterval options:UIViewAnimationOptionShowHideTransitionViews | UIViewAnimationOptionCurveEaseOut animations:^{
//        animateView.frame = finalFrame;
        animateView.alpha = self.isPresentation ? 1 : 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

/**
 *  从下往上的动画
 *
 *  @param transitionContext 动画的Context
 */
- (void)animateTransitionCoverVertical:(id)transitionContext {
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *animateView = self.isPresentation ? toView : fromView;
    UIViewController *animateViewController = self.isPresentation ? toViewController : fromViewController;
    
    CGRect onScreenFrame = [transitionContext finalFrameForViewController:animateViewController];
    CGRect offScreenFrame = CGRectOffset(onScreenFrame, 0, onScreenFrame.size.height);
    
    CGRect initialFrame = self.isPresentation ? offScreenFrame : onScreenFrame;
    CGRect finalFrame = self.isPresentation ? onScreenFrame : offScreenFrame;
    animateView.frame = initialFrame;
    
    [UIView animateWithDuration:kAnimatedTimeInterval delay:0.0 usingSpringWithDamping:200.0 initialSpringVelocity:2.0 options: UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
        animateView.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
