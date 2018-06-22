//
//  YQCellZiShiYingGaoDuCell.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2018/1/30.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQCellZiShiYingGaoDuCell.h"

@interface YQCellZiShiYingGaoDuCell ()

@property(nonatomic,strong) UIImageView *headerImageView;
@property(nonatomic,strong) UILabel *nickLabel;
@property(nonatomic,strong) UILabel *nameLabel;


@end

@implementation YQCellZiShiYingGaoDuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.headerImageView];
        [self.contentView addSubview:self.nickLabel];
        [self.contentView addSubview:self.nameLabel];
        [self addMasonry];
    }
    return self;
}
- (UIImageView *)headerImageView {
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.image = [UIImage imageNamed:@"3"];
//        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headerImageView;
}
- (UILabel *)nickLabel {
    if (_nickLabel == nil) {
        _nickLabel = [[UILabel alloc]init];
        _nickLabel.font = [UIFont systemFontOfSize:15];
        _nickLabel.textColor = [UIColor redColor];
        _nickLabel.textAlignment = NSTextAlignmentLeft;
        _nickLabel.numberOfLines = 0;
        _nickLabel.text = @"昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称昵称结束";
    }
    return _nickLabel;
}
- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = [UIColor orangeColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.numberOfLines = 0;
        _nameLabel.text = @"名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名字名结束";
    }
    return _nameLabel;
}
#pragma mark - 约束
- (void)addMasonry {
 
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).mas_offset(10);
//        make.right.mas_equalTo(self).mas_offset(-10);
//        make.top.mas_equalTo(self).mas_offset(0);
//        make.bottom.mas_equalTo(self).mas_offset(-10);
//        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 10, 10, 10));
//    }];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(10);
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
//        make.bottom.mas_equalTo(self.contentView).mas_offset(-30);
//        make.edges.equalTo(self.contentView).width.insets(UIEdgeInsetsMake(10, 10, 30, 10));
    }];
    
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(80);
        make.top.mas_equalTo(self.contentView).mas_offset(20);
        make.width.mas_equalTo(150);
        make.bottom.mas_equalTo(self.nameLabel.top).mas_offset(-10);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(80);
//        make.top.mas_equalTo(self.nickLabel.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(150);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
    }];
    
    
}




@end
