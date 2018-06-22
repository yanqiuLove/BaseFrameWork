//
//  YQAllTabBar.h
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//  完全自定义tabbar

#import <UIKit/UIKit.h>

@class YQAllTabBar;
@protocol YQAllTabBarDelegate <NSObject>

/**
 *  代理方法, 用于监听自定义TabBar按钮的点击事件
 *
 *  @param tabBar 触发事件的控件
 *  @param from   以前按钮的索引
 *  @param to     当前点击按钮的索引
 */
- (void)tabBar:(YQAllTabBar *)tabBar selectedBtnFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface YQAllTabBar : UIView

/**
 *  添加一个按钮
 *
 *  @param item 按钮需要显示的数据
 */
- (void)addItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<YQAllTabBarDelegate> delegate;

@end
