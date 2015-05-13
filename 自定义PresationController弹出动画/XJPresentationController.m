//
//  XJPresentationController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJPresentationController.h"

@implementation XJPresentationController

/** 自定义动画必须写的添加视图 */ //Transition 过渡
- (void)presentationTransitionWillBegin
{
        self.presentedView.frame = self.containerView.bounds;
    [self.containerView insertSubview:self.presentedView atIndex:0];
//    [self.containerView addSubview:self.presentedView];
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
