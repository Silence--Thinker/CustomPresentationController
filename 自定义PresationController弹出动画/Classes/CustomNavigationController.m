//
//  CustomNavigationController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 16/7/28.
//  Copyright © 2016年 FNWS. All rights reserved.
//

#import "CustomNavigationController.h"
#import "XJPresentationController.h"

@interface CustomNavigationController ()

@property (strong, nonatomic) XJPresenterStyle *presentSytle;

@end

@implementation CustomNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self xj_commonSetUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self xj_commonSetUp];
    }
    return self;
}

- (void)xj_commonSetUp {
    _presentSytle = [[XJPresenterStyle alloc] init];
    // modal自定义
    self.modalPresentationStyle = UIModalPresentationCustom;
    // 过渡代理
    self.transitioningDelegate =  _presentSytle;
}

- (void)setAnimateBlock:(TransitionAnimatedBlock)animateBlock {
    _animateBlock = [animateBlock copy];
    _presentSytle.animateBlock = animateBlock;
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration {
    _presentSytle.animationDuration = animationDuration;
}

@end
