//
//  YQTextView.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/10.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQTextView.h"
#import "YQTextAnimationCell.h"

@interface YQTextView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIButton *questionTitleButton;

/** 记录题号 */
@property(nonatomic,assign)NSInteger questionNumber;

@end

static NSString *cellIdentifier = @"YQTextAnimationCell";

@implementation YQTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.questionNumber = 1;
        [self addSubview:self.tableView];
        self.tableView.tableHeaderView = self.questionTitleButton;
        
    }
    return self;
}


- (void)setYqtextModel:(YQTextModel *)yqtextModel {
    _yqtextModel = yqtextModel;
    self.questionModel = [self.yqtextModel.questionArray objectAtIndex:0];
    [self.questionTitleButton setTitle:self.questionModel.questionTitle forState:UIControlStateNormal];
    
}

#pragma mark - Action
- (void)updataQuestionWithQuestionNumber:(NSInteger)questionNumber {
    if (questionNumber <= 0) {
        self.questionNumber = 0;
        /** 上一题到了第一题 */
        self.questionModel = [self.yqtextModel.questionArray objectAtIndex:0];
        [self.questionTitleButton setTitle:self.questionModel.questionTitle forState:UIControlStateNormal];
    }else if (self.questionNumber > self.yqtextModel.questionArray.count) {
        /** 最后一道题 */
        self.questionNumber = self.yqtextModel.questionArray.count;
        return;
    }else {
        self.questionModel = [self.yqtextModel.questionArray objectAtIndex:self.questionNumber - 1];
        [self.questionTitleButton setTitle:self.questionModel.questionTitle forState:UIControlStateNormal];
    }
    [self.tableView reloadData];
}

/** 上一题 */
- (void)topQuestion {
    self.questionNumber --;
    [self updataQuestionWithQuestionNumber:self.questionNumber];
    [self rightAnimation];
}

/** 下一题 */
- (void)nextQuestion {
    
}

/** 跳题 */
- (void)jumpQuestion {
    self.questionNumber ++;
    [self updataQuestionWithQuestionNumber:self.questionNumber];
    [self leftAnimation];
    
}
/**
 保存做题进度
 @param textId 量表ID
 @param teacherId 用户ID
 */
- (void)saveQuestionProgressWithTextId:(NSString *)textId teacherId:(NSString *)teacherId {
    
}


/**
 获取上次做题的进度
 @param textId 量表ID
 @param teacherId 用户ID
 */
- (void)getQuestionProgressWithTextId:(NSString *)textId teacherId:(NSString *)teacherId {
    
}
/** 左动画 */
- (void)leftAnimation {
    //     transform:形变属性，能完成的功能：平移、缩放、旋转
    [UIView animateWithDuration:0.5 animations:^{
        // 平移
        //            self.tableView.transform = CGAffineTransformMakeTranslation(-Kwidth - 30, 50);
        //            // 旋转
        //            self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_4);
        //            self.tableView.transform = CGAffineTransformMakeTranslation(Kwidth - 30, 100);
        
        CGAffineTransform translation = CGAffineTransformMakeTranslation(Kwidth - 30, 100);
        CGAffineTransform rotateScaleTranslation = CGAffineTransformRotate(translation,M_PI_4);
        self.tableView.transform = rotateScaleTranslation;
        
    }];
    self.tableView.transform = CGAffineTransformIdentity;
}
/** 右动画 */
- (void)rightAnimation {
    [UIView animateWithDuration:0.5 animations:^{
    
        //        self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_4);
        //         self.tableView.transform = CGAffineTransformMakeTranslation(-Kwidth, -50);
        CGAffineTransform translation = CGAffineTransformMakeTranslation(-Kwidth + 50,100);
        CGAffineTransform rotateScaleTranslation = CGAffineTransformRotate(translation,-M_PI_4);
        self.tableView.transform = rotateScaleTranslation;
        
    }];
    self.tableView.transform = CGAffineTransformIdentity;
    
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YQTextAnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[YQTextAnimationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    YQOptionModel *optionModel = [self.questionModel.optionArray objectAtIndex:indexPath.row];
    cell.optionModel = optionModel;
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.questionModel.optionArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.questionNumber ++;
    [self updataQuestionWithQuestionNumber:self.questionNumber];
    [self leftAnimation];
    
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, 100, Kwidth - 30, 300)];
        //隐藏分割线
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YQTextAnimationCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(UIButton *)questionTitleButton {
    if (_questionTitleButton == nil) {
        _questionTitleButton = [[UIButton alloc]init];
        _questionTitleButton.frame = CGRectMake(15, 0, Kwidth - 30, 60);
        _questionTitleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
        _questionTitleButton.backgroundColor = [UIColor orangeColor];
        _questionTitleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _questionTitleButton;
}

@end
