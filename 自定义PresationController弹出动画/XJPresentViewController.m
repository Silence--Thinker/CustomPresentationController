//
//  XJPresentViewController.m
//  自定义PresationController弹出动画
//
//  Created by Silence on 15/5/14.
//  Copyright (c) 2015年 FNWS. All rights reserved.
//

#import "XJPresentViewController.h"
#import "XJPresentationController.h"
#import "XJPresenterStyle.h"

@interface XJPresentViewController ()

@property (strong, nonatomic) XJPresenterStyle *presentSytle;

@end
@implementation XJPresentViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self xj_commonSetUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self xj_commonSetUp];
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self xj_commonSetUp];
    }
    return self;
}

- (void)xj_commonSetUp
{
    _presentSytle = [[XJPresenterStyle alloc] init];
    // modal自定义
    self.modalPresentationStyle = UIModalPresentationCustom;
    // 过渡代理
    self.transitioningDelegate =  _presentSytle;
}
@end
