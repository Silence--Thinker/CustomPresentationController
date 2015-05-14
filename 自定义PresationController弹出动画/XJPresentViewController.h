//
//  XJPresentViewController.h
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/14.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJPresenterStyle.h"

@interface XJPresentViewController : UIViewController


@property (copy, nonatomic) TransitionAnimatedBlock animateBlock;

@end
