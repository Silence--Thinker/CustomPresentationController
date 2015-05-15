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
    return AnimatedTimeInterval;
}

// 过渡动画的实现
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
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

    [UIView animateWithDuration:AnimatedTimeInterval delay:0.0 usingSpringWithDamping:200.0 initialSpringVelocity:2.0 options: UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
         animateView.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
