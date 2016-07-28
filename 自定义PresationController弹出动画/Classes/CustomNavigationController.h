//
//  CustomNavigationController.h
//  自定义PresationController弹出动画
//
//  Created by Silence on 16/7/28.
//  Copyright © 2016年 FNWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJPresenterStyle.h"

@interface CustomNavigationController : UINavigationController


/**
 *  动画的回调
 */
@property (copy, nonatomic) TransitionAnimatedBlock animateBlock;

@property (nonatomic, assign) NSTimeInterval animationDuration;

@end
