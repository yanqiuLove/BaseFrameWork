//
//  ZCCCircleProgressView.h
//  MOSOBOStudent
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCCommon.h"

@interface ZCCCircleProgressView : UIView

@property (nonatomic, strong)NSTimer *timer;

/** 设置进度条渐变色颜色数组 */
@property(nonatomic,strong) NSArray *colorsArray;
/** 进度条走完进度的动画时间 */
@property(nonatomic,assign) CGFloat animateTime;
/** 最终需要展示的进度 */
@property(nonatomic,assign) CGFloat progress;


// 下面这两个方法留着备用
- (void)deleteTimer;
//进度为0
- (void)animateToZero;

@end
