//
//  YQTextView.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/10.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQQuestionModel.h"
#import "YQTextModel.h"

@interface YQTextView : UIView

/** 量表 */
@property(nonatomic,strong) YQTextModel *yqtextModel;

@property(nonatomic,strong) YQQuestionModel *questionModel;


/** 上一题 */
- (void)topQuestion;

/** 下一题 */
- (void)nextQuestion;

/** 跳题 */
- (void)jumpQuestion;


/**
 保存做题进度
 @param textId 量表ID
 @param teacherId 用户ID
 */
- (void)saveQuestionProgressWithTextId:(NSString *)textId teacherId:(NSString *)teacherId;


/**
 获取上次做题的进度
 @param textId 量表ID
 @param teacherId 用户ID
 */
- (void)getQuestionProgressWithTextId:(NSString *)textId teacherId:(NSString *)teacherId;


/** 记录的所有答案 */
/** 用户的所有行为日志 */


@end
