//
//  YQMenuView.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQMenuView.h"

@implementation YQMenuView

/**
 *  弹出菜单
 *
 *  @param fromView 菜单需要指向的控件
 *  @param content  菜单需要显示的控件
 */
UIWindow *_window;
// block因为不是对应所以默认在栈里面, 栈里面的数据会自动被系统, 为了能够保证以后调用block时block没有被系统自动销毁, 那么我们应该将block转移到堆中
// 只要对block进行copy操作, 那么系统就会自动将block转移到堆中

// 定义全局变量保存传入的block
dismissBlock _dismiss;

+ (void)popFrom:(UIView *)fromView content:(UIView *)content dismiss:(dismissBlock)dismiss
{
    [self popFrom:fromView.frame inView:fromView.superview content:content dismiss:dismiss];
}

+ (void)popFrom:(CGRect)fromRect inView:(UIView *)inView content:(UIView *)content dismiss:(dismissBlock)dismiss
{
    _dismiss = [dismiss copy];
    
    // 1.创建window
    _window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.hidden = NO;
    _window.windowLevel = UIWindowLevelAlert;
    
    // 2.创建蒙版
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor clearColor];
    [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
    //将蒙版添加到window上
    [_window addSubview:cover];
    
    // 3.创建菜单
    UIImageView *menuView = [[UIImageView alloc] init];
    menuView.userInteractionEnabled = YES;
    UIImage *image = [UIImage imageNamed:@"popover_background"];
    menuView.image = image;
    // 将菜单添加到蒙版上
    [cover addSubview:menuView];
    
    // 4.添加内容到菜单上
    // 设置内容的X和Y值(间隙)
    content.sc_x = 15;
    content.sc_y = 18;
    [menuView addSubview:content];
    
    // 5.设置菜单容器的frame
    CGFloat menuViewW = CGRectGetMaxX(content.frame) + content.sc_x;
    CGFloat menuViewH = CGRectGetMaxY(content.frame) + content.sc_y;
    menuView.frame = CGRectMake(0, 0, menuViewW, menuViewH);
    
    // 获取需要指向控件的frame, 并且是转换为和蒙版同一个坐标系的frame
    // 将fromView.frame的坐标系 从 fromView.superview  转换为 _window
    CGRect resultFrame = [_window convertRect:fromRect fromView:inView];
    
    // 设置菜单的Y的值
    menuView.sc_y = CGRectGetMaxY(resultFrame);
    
    /*
     // 获取需要执行控件的center
     CGPoint resultCenter = [_window convertPoint:fromView.center fromView:fromView.superview];
     // 设置菜单的centerX的值
     menuView.centerX = resultCenter.x;
     */
    
    menuView.sc_centerX = resultFrame.origin.x + (resultFrame.size.width * 0.5);
    
    // 6.显示菜单
    _window.hidden = NO;
    
}

UIViewController *_contentVC;
+ (void)popFrom:(UIView *)fromView contentVC:(UIViewController *)contentVC dismiss:(dismissBlock)dismiss
{
    // 保命
    _contentVC = contentVC;
    
    // 显示
    [self popFrom:fromView content:_contentVC.view dismiss:dismiss];
}


+ (void)coverClick:(UIButton *)btn
{
    _window = nil;
    
    // 通知调用者
    if (_dismiss != nil) {
        _dismiss();
    }
}

@end
