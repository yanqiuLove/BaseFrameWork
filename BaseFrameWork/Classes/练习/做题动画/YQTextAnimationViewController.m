//
//  YQTextAnimationViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/10.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQTextAnimationViewController.h"
#import "YQTextAnimationCell.h"
#import "YQTextModel.h"
#import "YQTextView.h"
#import "YQOptionModel.h"
#import "YQQuestionModel.h"
@interface YQTextAnimationViewController ()

@property(nonatomic,strong) YQTextView *textView;
@property(nonatomic,strong) UIButton *topQuestionButton;
@property(nonatomic,strong) UIButton *jumpQuestionButton;


@end

static NSString *cellIdentifier = @"YQTextAnimationCell";

@implementation YQTextAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView = [[YQTextView alloc]initWithFrame:CGRectMake(0, 100, Kwidth, 300)];
    [self.view addSubview:self.textView];
    self.topQuestionButton.frame = CGRectMake(60, 500, 60, 30);
    self.jumpQuestionButton.frame = CGRectMake(150, 500, 60, 30);
    [self.view addSubview:self.topQuestionButton];
    [self.view addSubview:self.jumpQuestionButton];
    
    
    NSDictionary *resultDic = @{
                                @"questionArray":@[
                                        
                                        @{
                                            @"questionId":@"1",
                                            @"questionType":@"单选",
                                            @"questionTitle":@"这是第1道题目",
                                            @"optionArray":@[
                                                    
                                                    @{
                                                        @"optionId":@"1",
                                                        @"optionContent":@"1"
                                                        },
                                                    @{
                                                        @"optionId":@"1",
                                                        @"optionContent":@"1"
                                                        },
                                                    @{
                                                        @"optionId":@"1",
                                                        @"optionContent":@"1"
                                                        },
                                                    @{
                                                        @"optionId":@"1",
                                                        @"optionContent":@"1"
                                                        }
                                                    
                                                    ],
                                            
                                            
                                        },
                                        @{
                                            @"questionId":@"1",
                                            @"questionType":@"多选",
                                            @"questionTitle":@"这是第2道题目",
                                            @"optionArray":@[
                                                    
                                                    @{
                                                        @"optionId":@"2",
                                                        @"optionContent":@"2"
                                                        },
                                                    @{
                                                        @"optionId":@"2",
                                                        @"optionContent":@"2"
                                                        },
                                                    @{
                                                        @"optionId":@"2",
                                                        @"optionContent":@"2"
                                                        },
                                                    @{
                                                        @"optionId":@"2",
                                                        @"optionContent":@"2"
                                                        }
                                                    
                                                    ],
                                            
                                            
                                            },
                                        @{
                                            @"questionId":@"1",
                                            @"questionType":@"单选",
                                            @"questionTitle":@"这是第3道题目",
                                            @"optionArray":@[
                                                    
                                                    @{
                                                        @"optionId":@"3",
                                                        @"optionContent":@"3"
                                                        },
                                                    @{
                                                        @"optionId":@"3",
                                                        @"optionContent":@"3"
                                                        },
                                                    @{
                                                        @"optionId":@"3",
                                                        @"optionContent":@"3"
                                                        },
                                                    @{
                                                        @"optionId":@"3",
                                                        @"optionContent":@"3"
                                                        }
                                                    
                                                    ],
                                            
                                            
                                            },
                                        @{
                                            @"questionId":@"1",
                                            @"questionType":@"单选",
                                            @"questionTitle":@"这是第4道题目",
                                            @"optionArray":@[
                                                    
                                                    @{
                                                        @"optionId":@"4",
                                                        @"optionContent":@"4"
                                                        },
                                                    @{
                                                        @"optionId":@"4",
                                                        @"optionContent":@"4"
                                                        },
                                                    @{
                                                        @"optionId":@"4",
                                                        @"optionContent":@"4"
                                                        },
                                                    @{
                                                        @"optionId":@"4",
                                                        @"optionContent":@"4"
                                                        }
                                                    
                                                    ],
                                            
                                            
                                            },
                                        @{
                                            @"questionId":@"1",
                                            @"questionType":@"单选",
                                            @"questionTitle":@"这是第5道题目",
                                            @"optionArray":@[
                                                    
                                                    @{
                                                        @"optionId":@"5",
                                                        @"optionContent":@"5"
                                                        },
                                                    @{
                                                        @"optionId":@"5",
                                                        @"optionContent":@"5"
                                                        },
                                                    @{
                                                        @"optionId":@"5",
                                                        @"optionContent":@"5"
                                                        },
                                                    @{
                                                        @"optionId":@"5",
                                                        @"optionContent":@"5"
                                                        }
                                                    
                                                    ],
                                            
                                            },
                                        @{
                                            @"questionId":@"1",
                                            @"questionType":@"单选",
                                            @"questionTitle":@"这是第6道题目",
                                            @"optionArray":@[
                                                    
                                                    @{
                                                        @"optionId":@"6",
                                                        @"optionContent":@"6"
                                                        },
                                                    @{
                                                        @"optionId":@"6",
                                                        @"optionContent":@"6"
                                                        },
                                                    @{
                                                        @"optionId":@"6",
                                                        @"optionContent":@"6"
                                                        },
                                                    @{
                                                        @"optionId":@"6",
                                                        @"optionContent":@"6"
                                                        }
                                                    
                                                    ],
                                            
                                            
                                            },
                                        
                                        ],
                                @"id":@"123"
                                };
    
    
    YQTextModel *yqTextModel = [YQTextModel mj_objectWithKeyValues:resultDic];
    self.textView.yqtextModel = yqTextModel;
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView topQuestion];
}

#pragma mark - Action
/** 上一题 */
- (void)topQuestionAction {
    [self.textView topQuestion];
}
/** 跳过 */
- (void)jumpQuestionAction {
    [self.textView jumpQuestion];
}
#pragma mark - Lazy
- (UIButton *)topQuestionButton {
    if (_topQuestionButton == nil) {
        _topQuestionButton = [[UIButton alloc]init];
        [_topQuestionButton setTitle:@"上一题" forState:UIControlStateNormal];
        _topQuestionButton.backgroundColor = [UIColor cyanColor];
        [_topQuestionButton addTarget:self action:@selector(topQuestionAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topQuestionButton;
}
- (UIButton *)jumpQuestionButton {
    if (_jumpQuestionButton == nil) {
        _jumpQuestionButton = [[UIButton alloc]init];
        [_jumpQuestionButton setTitle:@"跳过" forState:UIControlStateNormal];
        _jumpQuestionButton.backgroundColor = [UIColor cyanColor];
        [_jumpQuestionButton addTarget:self action:@selector(jumpQuestionAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpQuestionButton;
}







@end
