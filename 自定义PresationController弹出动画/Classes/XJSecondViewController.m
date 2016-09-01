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

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    CGFloat duration = 0.8;
    self.animationDuration = duration;
    self.animateBlock = ^(id <UIViewControllerContextTransitioning> transitionContext, UIViewController * animateViewController, UIView *animateView, BOOL isPresentation){
        
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
        CGRect onScreenFrame = [transitionContext finalFrameForViewController:animateViewController];
        CGRect offScreenFrame = CGRectOffset(onScreenFrame, 0, onScreenFrame.size.height);
    
        CGRect initialFrame = isPresentation ? offScreenFrame : onScreenFrame;
        CGRect finalFrame = isPresentation ? onScreenFrame : offScreenFrame;
        
        animateView.frame = onScreenFrame;
        animateView.alpha = isPresentation ? 0 : 1;
    
        [UIView transitionWithView:animateView duration:duration options:UIViewAnimationOptionShowHideTransitionViews | UIViewAnimationOptionCurveEaseOut animations:^{
                    animateView.frame = onScreenFrame;
            animateView.alpha = isPresentation ? 1 : 0;
        } completion:^(BOOL finished) {
            if (!isPresentation) {
                [fromView removeFromSuperview];
            }
            [transitionContext completeTransition:YES];
        }];
    };
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
