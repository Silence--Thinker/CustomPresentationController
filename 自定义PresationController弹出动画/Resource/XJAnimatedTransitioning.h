//
//  XJAnimatedTransitioning.h
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/13.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import <UIKit/UIKit.h>

const  NSTimeInterval  AnimatedTimeInterval = 0.8;

typedef void(^TransitionAnimatedBlock)(id <UIViewControllerContextTransitioning> transitionContext,  BOOL isPresentation);

@interface XJAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
/**
 *  是否是present状态
 */
@property (assign, nonatomic) BOOL isPresentation;

@property (copy, nonatomic) TransitionAnimatedBlock animateBlock;

@end
