//
//  XJPresentationController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJPresentationController.h"

@interface XJPresentationController ()
/**
 *  visual 影响视图 自带遮罩效果
 */
@property (strong, nonatomic) UIVisualEffectView *effectView;
/**
 *  具体的遮罩效果
 */
@property (assign, nonatomic) UIVisualEffect *effect;

@end
@implementation XJPresentationController

/** 自定义动画必须写的添加视图 */ //Transition 过渡
- (void)presentationTransitionWillBegin
{
    // 添加视图
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView insertSubview:self.presentedView atIndex:0];
}
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
}
- (void)dismissalTransitionWillBegin
{
    
}
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    [self.presentedView removeFromSuperview];
}
@end
