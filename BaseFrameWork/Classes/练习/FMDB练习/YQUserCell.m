//
//  YQUserCell.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQUserCell.h"

@interface YQUserCell ()

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *ageLabel;
@property(nonatomic,strong) UILabel *idLabel;
@property(nonatomic,strong) UIView *lineView;


@end

@implementation YQUserCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.nameLabel];
        [self addSubview:self.ageLabel];
        [self addSubview:self.idLabel];
        [self addSubview:self.lineView];
        [self addMasonry];
        
    }
    return self;
}

- (void)configModel:(YQUserModel *)model {
    if (model) {
        self.nameLabel.text = [NSString stringWithFormat:@"姓名：%@",model.userName];
        self.ageLabel.text = [NSString stringWithFormat:@"年龄：%ld",model.age];
        self.idLabel.text = [NSString stringWithFormat:@"ID：%ld",model.userId];
    }
    return;
}

#pragma mark - Lazy
- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
    }
    return _nameLabel;
}
- (UILabel *)ageLabel {
    if (_ageLabel == nil) {
        _ageLabel = [[UILabel alloc]init];
    }
    return _ageLabel;
}
- (UILabel *)idLabel {
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc]init];
    }
    return _idLabel;
}
- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    }
    return _lineView;
}
#pragma mark - 约束
- (void)addMasonry {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self).mas_offset(0);
        make.top.mas_equalTo(self).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(Kwidth, [UIView getHeightWithHeight:30]));
        
    }];
    
    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self).mas_offset(0);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset([UIView getHeightWithHeight:5]);
        make.size.mas_equalTo(CGSizeMake(Kwidth, [UIView getHeightWithHeight:30]));
        
    }];
    
    [self.idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self).mas_offset(0);
        make.top.mas_equalTo(self.ageLabel.mas_bottom).mas_offset([UIView getHeightWithHeight:5]);
        make.size.mas_equalTo(CGSizeMake(Kwidth, [UIView getHeightWithHeight:30]));
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.right.mas_equalTo(self).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(Kwidth, 1));
        
    }];
}

@end
