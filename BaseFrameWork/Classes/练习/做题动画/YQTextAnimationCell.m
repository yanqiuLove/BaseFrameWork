//
//  YQTextAnimationCell.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/8/10.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQTextAnimationCell.h"

@interface YQTextAnimationCell ()

@property(nonatomic,strong) UIImageView *selectImageView;
@property(nonatomic,strong) UILabel *optionContentLabel;


@end

@implementation YQTextAnimationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.selectImageView];
        [self.contentView addSubview:self.optionContentLabel];
        [self addMasonry];
        
    }
    return self;
}

- (void)setOptionModel:(YQOptionModel *)optionModel {
    _optionModel = optionModel;
    self.optionContentLabel.text = optionModel.optionContent;
}
#pragma mark - Lazy
- (UIImageView *)selectImageView {
    if (_selectImageView == nil) {
        _selectImageView = [[UIImageView alloc]init];
        _selectImageView.image = [UIImage imageNamed:@"2"];
        _selectImageView.layer.masksToBounds = YES;
        _selectImageView.layer.cornerRadius = 5;
    }
    return _selectImageView;
}

- (UILabel *)optionContentLabel {
    if (_optionContentLabel == nil) {
        _optionContentLabel = [[UILabel alloc]init];
        _optionContentLabel.font = [UIFont systemFontOfSize:15];
    }
    return _optionContentLabel;
}

#pragma mark - 约束
- (void)addMasonry {
 
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.centerY.mas_equalTo(self.contentView).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(10, 10));
        
    }];
    
    [self.optionContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.selectImageView.right).mas_offset(15);
        make.centerY.mas_equalTo(self.contentView).mas_offset(0);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        
        
    }];
    
}

@end
