//
//  YQTabBar.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQTabBar.h"
@interface YQTabBar ()

/** 加号按钮 */
@property(nonatomic,strong) UIButton *plusBtn;

@end

@implementation YQTabBar

// 通过代码创建控件时会调用
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

// 通过xib/Storboard创建时调用
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // 创建一个加号按钮, 添加到当前控件中
    // 1.创建按钮
    UIButton *plusBtn = [[UIButton alloc] init];
    plusBtn.tag = 1000;
    // 2.设置背景图片
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // 3.设置图标
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    // 4.添加
    [self addSubview:plusBtn];
    
    self.plusBtn = plusBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger index = 0;
    for (UIView *child in self.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            // 2.计算每个按钮的frame
            CGFloat childW = self.frame.size.width / 5;
            CGFloat childH = self.frame.size.height;
            CGFloat childX = index * childW;
            CGFloat childY = 0;
            
            // 判断是否是中间一个按钮
            if (index == 2) {
                index++;
                childX = index * childW;
            }
            index++;
            child.frame = CGRectMake(childX, childY, childW, childH);
        }
        
    }
    self.plusBtn.sc_size = self.plusBtn.currentBackgroundImage.size;
    self.plusBtn.sc_centerX = self.sc_width * 0.5;
    self.plusBtn.sc_centerY = self.sc_height * 0.5;
    
    
}

@end
