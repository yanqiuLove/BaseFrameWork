//
//  YQKnowledgeViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQKnowledgeViewController.h"
#import "YQKnowledgeTableViewCell.h"


@interface YQKnowledgeViewController ()

@property(nonatomic,strong) UILabel *backGroundLabel;

@end

@implementation YQKnowledgeViewController

static NSString *cellIdentifier = @"YQKnowledgeTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"知识讲解";
    [self.view addSubview:self.backGroundLabel];
    [self addMasonry];
    
}
#pragma mark - Lazy
- (UILabel *)backGroundLabel {
    if (_backGroundLabel == nil) {
        _backGroundLabel = [[UILabel alloc]init];
        _backGroundLabel.font = [UIFont systemFontOfSize:15];
        _backGroundLabel.textColor = [UIColor colorWithHexString:@""];
        _backGroundLabel.textAlignment = NSTextAlignmentCenter;
        _backGroundLabel.backgroundColor = [UIColor cyanColor];
    }
    return _backGroundLabel;
}
#pragma mark - 约束
- (void)addMasonry {
    
    [self.backGroundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view.centerX).mas_offset(0);
        make.centerY.mas_equalTo(self.view.centerY).mas_offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(200);
//        make.height.mas_lessThanOrEqualTo(300).priorityHigh();
        make.height.mas_greaterThanOrEqualTo(300).priorityHigh();
        
    }];
    
}

@end
