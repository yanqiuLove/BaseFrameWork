//
//  YQMenuView.h
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^dismissBlock)();

@interface YQMenuView : NSObject

/**
 *  显示菜单
 *
 *  @param fromView 需要指向控件
 *  @param content  需要显示的控件
 */
+ (void)popFrom:(UIView *)fromView content:(UIView *)content dismiss:(dismissBlock)dismiss;

+ (void)popFrom:(CGRect)fromRect inView:(UIView *)inView content:(UIView *)content dismiss:(dismissBlock)dismiss;

+ (void)popFrom:(UIView *)fromView contentVC:(UIViewController *)contentVC dismiss:(dismissBlock)dismiss;

@end
