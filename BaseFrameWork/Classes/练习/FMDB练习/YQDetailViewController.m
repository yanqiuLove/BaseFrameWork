//
//  YQDetailViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQDetailViewController.h"
#import "YQDBManager.h"

@interface YQDetailViewController ()

@property(nonatomic,strong) UITextField *idTextField;
@property(nonatomic,strong) UITextField *nameTextField;
@property(nonatomic,strong) UITextField *ageTextField;
@property(nonatomic,strong) UIButton *addButton;

@end

@implementation YQDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"YQDetailViewController";
    
    
    [self.view addSubview:self.idTextField];
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.ageTextField];
    [self.view addSubview:self.addButton];
    [self addMasonry];
    
//    if (self.model) {
//        self.idTextField.text = [NSString stringWithFormat:@"ID：%ld",self.model.userId];
//        self.nameTextField.text = [NSString stringWithFormat:@"姓名：%@",self.model.userName];
//        self.ageTextField.text = [NSString stringWithFormat:@"年龄：%ld",self.model.age];
//    }
    
}
#pragma mark - Action
- (void)clicAddButtonAction {
    YQUserModel *model = [[YQUserModel alloc]init];
    model.userId = [self.idTextField.text integerValue];
    model.userName = self.nameTextField.text;
    model.age = [self.ageTextField.text integerValue];
    [[YQDBManager sharedDataBase] addStudent:model];
}

#pragma mark - Lazy
- (UITextField *)idTextField {
    if (_idTextField == nil) {
        _idTextField = [[UITextField alloc]init];
        _idTextField.textAlignment = NSTextAlignmentCenter;
        _idTextField.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
        _idTextField.placeholder = @"输入id";
    }
    return _idTextField;
}
- (UITextField *)nameTextField {
    if (_nameTextField == nil) {
        _nameTextField = [[UITextField alloc]init];
        _nameTextField.textAlignment = NSTextAlignmentCenter;
        _nameTextField.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
        _nameTextField.placeholder = @"输入姓名";
    }
    return _nameTextField;
}
- (UITextField *)ageTextField {
    if (_ageTextField == nil) {
        _ageTextField = [[UITextField alloc]init];
        _ageTextField.textAlignment = NSTextAlignmentCenter;
        _ageTextField.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
        _ageTextField.placeholder = @"输入年龄";
    }
    return _ageTextField;
}
- (UIButton *)addButton {
    if (_addButton == nil) {
        _addButton = [[UIButton alloc]init];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:[UIView getHeightWithHeight:15]];
        [_addButton setTitle:@"确定添加" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor colorWithHexString:@"000000"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(clicAddButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}
#pragma mark - 约束
- (void)addMasonry {
 
    [self.idTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.view).mas_offset(150);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(Kwidth, 30));
        
    }];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.idTextField.mas_bottom).mas_offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(Kwidth, 30));
        
    }];
    
    [self.ageTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.nameTextField.mas_bottom).mas_offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(Kwidth, 30));
        
    }];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.ageTextField.mas_bottom).mas_offset(50);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
    }];
}

@end
