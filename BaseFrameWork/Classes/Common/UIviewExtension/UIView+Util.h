//
//  UIView+Util.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/3/23.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)

@property (nonatomic, assign) CGFloat sc_x;
@property (nonatomic, assign) CGFloat sc_y;
@property (nonatomic, assign) CGFloat sc_width;
@property (nonatomic, assign) CGFloat sc_height;

@property (nonatomic, assign) CGFloat sc_centerX;
@property (nonatomic, assign) CGFloat sc_centerY;
@property (nonatomic, assign) CGSize sc_size;
@property (nonatomic, assign) CGPoint sc_origin;

@property (nonatomic, assign) CGFloat sc_bottom;


- (void)removeAllSubviews;
- (UIViewController *)viewController;
+ (void)clipsToBounds:(UIView *)view cornerRadius:(CGFloat)cornerRadius;

+ (CGFloat)getHeightWithHeight:(CGFloat)height;

@end
