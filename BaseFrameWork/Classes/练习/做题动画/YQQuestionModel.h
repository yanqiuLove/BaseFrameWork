//
//  YQQuestionModel.h
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/10.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQQuestionModel : NSObject

@property (nonatomic, copy) NSString *questionId;
@property(nonatomic,strong) NSArray *optionArray;
@property (nonatomic, copy) NSString *questionTitle;
/** 问题的类型  单选、多选、填空 */
@property (nonatomic, copy) NSString *questionType;


@end
