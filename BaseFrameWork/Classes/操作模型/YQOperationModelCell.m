//
//  YQOperationModelCell.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/25.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQOperationModelCell.h"

@interface YQOperationModelCell ()<UITextFieldDelegate>

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UITextField *sexTextField;
@property(nonatomic,strong) UILabel *ageLabel;
@property(nonatomic,strong) UIImageView *iconImageView;


@end

@implementation YQOperationModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
     
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.sexTextField];
        [self.contentView addSubview:self.ageLabel];
        [self.contentView addSubview:self.iconImageView];
        [self addMasonry];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSLog(@"cell的所有子控件+++++++%@",self.subviews);
        
    }
    return self;
}
- (void)setCeShimodel:(YQCeShiModel *)ceShimodel {
    _ceShimodel = ceShimodel;
    //计算实际高度并赋值
    self.nameLabel.text = ceShimodel.name;
    self.sexTextField.text = ceShimodel.sex;
    self.ageLabel.text = ceShimodel.age;
//    self.ceShimodel.cellHeight = 60;
    if (ceShimodel.whetherSelected) {
        self.backgroundColor = [UIColor cyanColor];
    }
    self.iconImageView.hidden = NO;
//    int x = 60 + arc4random() % 30;
//    self.ceShimodel.cellHeight = x;
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.ceShimodel.sex = textField.text;
}

#pragma mark - 约束
- (void)addMasonry {
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake((Kwidth - 30)/3, 30));
        
    }];
    [self.sexTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.nameLabel.mas_right).mas_offset(0);
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake((Kwidth - 30)/3, 40));
        
    }];
    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.sexTextField.mas_right).mas_offset(0);
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake((Kwidth - 30)/3, 40));
        
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        
    }];
    
}

#pragma mark - Lazy
- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}
- (UITextField *)sexTextField {
    if (_sexTextField == nil) {
        _sexTextField = [[UITextField alloc]init];
        _sexTextField.delegate = self;
    }
    return _sexTextField;
}
- (UILabel *)ageLabel {
    if (_ageLabel == nil) {
        _ageLabel = [[UILabel alloc]init];
    }
    return _ageLabel;
}
- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"app_logo"];
        _iconImageView.hidden = YES;
    }
    return _iconImageView;
}

@end
