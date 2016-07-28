//
//  XJSecondViewController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJSecondViewController.h"


extern NSTimeInterval const  kAnimatedTimeInterval;

@interface XJSecondViewController ()

@end
@implementation XJSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    CGFloat duration = 0.3;
    self.animationDuration = duration;
    self.animateBlock = ^(id <UIViewControllerContextTransitioning> transitionContext,  BOOL isPresentation){
        
            UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
            UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
            UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        
            UIView *animateView = isPresentation ? toView : fromView;
            UIViewController *animateViewController = isPresentation ? toViewController : fromViewController;
        
            CGRect onScreenFrame = [transitionContext finalFrameForViewController:animateViewController];
            CGRect offScreenFrame = CGRectOffset(onScreenFrame, 0, onScreenFrame.size.height);
        
            CGRect initialFrame = isPresentation ? offScreenFrame : onScreenFrame;
            CGRect finalFrame = isPresentation ? onScreenFrame : offScreenFrame;
            animateView.frame = initialFrame;
            //    animateView.frame = CGRectInset(finalFrame, finalFrame.size.width/2, finalFrame.size.height/2);
            animateView.frame = onScreenFrame;
            animateView.alpha = isPresentation ? 0 : 1;
        
            [UIView transitionWithView:animateView duration:duration options:UIViewAnimationOptionShowHideTransitionViews | UIViewAnimationOptionCurveEaseOut animations:^{
                //        animateView.frame = finalFrame;
                animateView.alpha = isPresentation ? 1 : 0;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
    };
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
