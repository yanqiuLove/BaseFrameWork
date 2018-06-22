//
//  YQTitleCollectionViewCell.m
//  BaseFrameWork
//
//  Created by 依小窗 on 2018/5/17.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQTitleCollectionViewCell.h"
@interface YQTitleCollectionViewCell ()

@property(nonatomic,strong) UILabel *titleLabel;

@end

@implementation YQTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.text = @"123";
        self.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.titleLabel];
        
        [self addMasonry];
        
    }
    return self;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark - 约束
- (void)addMasonry {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.contentView).mas_offset(0);
        make.height.mas_equalTo(60);
    }];
}

@end
