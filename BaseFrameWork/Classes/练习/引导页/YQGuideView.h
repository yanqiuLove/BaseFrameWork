//
//  YQGuideView.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/21.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, pageControlStyle) {
    pageControlStyleNormal,//简单的翻页，pagecontrol没有动态效果
    pageControlStyleHavePageControl,//pagecontrol具有动态效果
    pageControlStyleChangePageControl//改变pagecontrol的样式
};


@interface YQGuideView : UIView

- (void)initWithGuideImageArray:(NSArray *)guideImageArray pageControlStyle:(pageControlStyle)style selectedColor:(UIColor *)selectedColor noSelectedColor:(UIColor *)noSelectedColor;


@end
