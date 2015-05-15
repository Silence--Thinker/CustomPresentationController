//
//  UIView+XJ.h
//  ConferenceCall
//
//  Created by Silent on 15/3/5.
//  Copyright (c) 2015年 ZMFC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XJ)
// 分类中不会自动生成set  get方法
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;

@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

@property (assign, nonatomic) CGSize size;

@end
