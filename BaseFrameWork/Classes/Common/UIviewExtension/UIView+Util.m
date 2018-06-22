//
//  UIView+Util.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/3/23.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

// x
- (CGFloat)sc_x
{
    return self.frame.origin.x;
}
- (void)setSc_x:(CGFloat)sc_x
{
    CGRect frame = self.frame;
    frame.origin.x = sc_x;
    self.frame = frame;
}

// y
- (CGFloat)sc_y
{
    return self.frame.origin.y;
}

- (void)setSc_y:(CGFloat)sc_y
{
    CGRect frame = self.frame;
    frame.origin.y = sc_y;
    self.frame = frame;
}


// h
- (CGFloat)sc_height
{
    return self.frame.size.height;
}

- (void)setSc_height:(CGFloat)sc_height
{
    CGRect frame = self.frame;
    frame.size.height = sc_height;
    self.frame = frame;
}


// w
- (CGFloat)sc_width
{
    return self.frame.size.width;
}

- (void)setSc_width:(CGFloat)sc_width
{
    CGRect frame = self.frame;
    frame.size.width = sc_width;
    self.frame = frame;
}

- (void)setSc_size:(CGSize)sc_size
{
    CGRect frame = self.frame;
    frame.size = sc_size;
    self.frame = frame;
}

// centerX
- (void)setSc_centerX:(CGFloat)sc_centerX
{
    CGPoint center = self.center;
    center.x = sc_centerX;
    self.center = center;
}
- (CGFloat)sc_centerX
{
    return self.center.x;
}

// centerY
- (void)setSc_centerY:(CGFloat)sc_centerY
{
    CGPoint center = self.center;
    center.y = sc_centerY;
    self.center = center;
}
- (CGFloat)sc_centerY
{
    return self.center.y;
}

// size
- (CGSize)sc_size
{
    return self.frame.size;
}

- (void)setSc_origin:(CGPoint)sc_origin
{
    CGRect frame = self.frame;
    frame.origin = sc_origin;
    self.frame = frame;
}

- (CGPoint)sc_origin
{
    return self.frame.origin;
}


- (CGFloat)sc_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setSc_bottom:(CGFloat)sc_bottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = sc_bottom - self.frame.size.height;
    self.frame = newframe;
}


+ (void)clipsToBounds:(UIView *)view cornerRadius:(CGFloat)cornerRadius {
    view.layer.cornerRadius = cornerRadius;
    view.clipsToBounds = YES;
}


- (UIViewController*)viewController {
    for (UIView* next=[self superview]; next; next=next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

//适配高
+ (CGFloat)getHeightWithHeight:(CGFloat)height {
    CGFloat proportion = 0.f;
    
    if (IS_IPHONE_4) {
        
        proportion = 480.f/667.f;
        return height * proportion;
        
    } else if (IS_IPHONE_5) {
        
        proportion = 568.f/667.f;
        return height * proportion;
    } else if (IS_IPHONE_6Plus) {
        
        proportion = 736.f/667.f;
        return height * proportion;
    }
    return height;
}

@end
