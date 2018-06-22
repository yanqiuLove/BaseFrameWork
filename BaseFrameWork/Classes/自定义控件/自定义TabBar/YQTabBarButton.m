//
//  YQTabBarButton.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/6/22.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQTabBarButton.h"

@implementation YQTabBarButton

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
    // 设置图片居中
    self.imageView.contentMode = UIViewContentModeCenter;
    // 设置标题居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 设置文字字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    
    // 设置按钮标题颜色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // 注意: 如果相对自定义按钮通过transform进行缩放, 那么不能在自定义按钮中访问self.frame
    // Y = 按钮的高度 - 图片的高度
    CGFloat titleY = contentRect.size.height* 0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - contentRect.size.height * 0.6;
    CGFloat titleX = 0;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

/*
 通过这种方式也能达到位置变化的目的
 - (void)layoutSubviews
 {
 [super layoutSubviews];
 
 self.imageView.y  = 0;
 self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
 self.titleLabel.centerX = self.imageView.centerX;
 }
 */

-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
