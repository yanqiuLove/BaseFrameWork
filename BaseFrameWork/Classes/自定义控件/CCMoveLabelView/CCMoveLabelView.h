//
//  CCMoveLabelView.h
//  Cece
//
//  Created by 依小窗 on 2018/11/18.
//  跑马灯  主要用于帖子标题超过一定长度时自动轮播展示帖子的标题内容

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCMoveLabelView : UIView
/** 展示的标题内容 */
@property(nonatomic,copy) NSString *titleStr;

@end

NS_ASSUME_NONNULL_END
