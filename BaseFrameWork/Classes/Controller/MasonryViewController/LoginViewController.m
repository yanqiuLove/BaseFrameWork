//
//  LoginViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/18.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

/** iconImageView */
@property(nonatomic,strong)UIImageView *iconImageView;

/** 账户名 */
@property(nonatomic,strong)UITextField *userNameTextField;

/** 密码 */
@property(nonatomic,strong)UITextField *passwordTextField;

/** 登录 */
@property(nonatomic,strong)UIButton *loginButton;

/** 注册 */
@property(nonatomic,strong)UIButton *singInButton;

/** 提示信息 */
@property(nonatomic,strong)UILabel *messageLabel;

/** 忘记密码 */
@property(nonatomic,strong)UIView *forgetView;

/** 底部scrollview */
@property(nonatomic,strong)UIScrollView *bottomScrollView;

/** 记录scrollview需要达到的位置 */
@property(nonatomic,assign)CGFloat setContent;


@end

@implementation LoginViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //点击任意地方隐藏键盘
    [self setUpForDismissKeyboard];
    if (Kwidth == IPhone5Width) {
        self.setContent = 180.0;
    }else{
        self.setContent = 160.0;
    }
    [self addView];
    [self addMasonry];
}

- (void)addView{
    
    [self.view addSubview:self.bottomScrollView];
    
    //iconImageView
    [self.bottomScrollView addSubview:self.iconImageView];
    //用户名
    [self.bottomScrollView addSubview:self.userNameTextField];
    //密码
    [self.bottomScrollView addSubview:self.passwordTextField];
    //登录按钮
    [self.bottomScrollView addSubview:self.loginButton];
    //注册按钮
    [self.bottomScrollView addSubview:self.singInButton];
    //最下方提示label
    [self.bottomScrollView addSubview:self.messageLabel];
    //忘记密码的view
    [self.bottomScrollView addSubview:self.forgetView];
    
}

#pragma mark - lazy
//iconImageView
- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"app_logo"];
    }
    return _iconImageView;
}
//用户名
- (UITextField *)userNameTextField {
    if (_userNameTextField == nil) {
        _userNameTextField = [[UITextField alloc]init];
//        _userNameTextField.borderStyle = UITextBorderStyleNone;
        _userNameTextField.placeholder = @"请输入手机号";
        
        _userNameTextField.layer.masksToBounds = YES;
        _userNameTextField.layer.cornerRadius = 23;
        _userNameTextField.layer.borderWidth = 1;
        _userNameTextField.layer.borderColor = [UIColor colorWithHexString:@"#D4D4D4"].CGColor;
        
        UIView *iconView = [[UIView alloc] init];
        iconView.sc_width = 15;
        _userNameTextField.leftView = iconView;
        _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _userNameTextField;
}
//密码
- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc]init];
        _passwordTextField.placeholder = @"请输入密码";
        
        _passwordTextField.layer.masksToBounds = YES;
        _passwordTextField.layer.cornerRadius = 23;
        _passwordTextField.layer.borderWidth = 1;
        _passwordTextField.layer.borderColor = [UIColor colorWithHexString:@"#D4D4D4"].CGColor;
        
        
        UIView *iconView = [[UIView alloc] init];
        iconView.sc_width = 15;
        _passwordTextField.leftView = iconView;
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        
        _passwordTextField.rightView = self.forgetView;
        _passwordTextField.rightViewMode = UITextFieldViewModeAlways;
        
    }
    return _passwordTextField;
}
//登录
- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [[UIButton alloc]init];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.backgroundColor = [UIColor colorWithHexString:@"#468AFF"];
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 23;
        
        [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}
//注册
- (UIButton *)singInButton {
    if (_singInButton == nil) {
        _singInButton = [[UIButton alloc]init];
        [_singInButton setTitle:@"立即注册" forState:UIControlStateNormal];
        [_singInButton setTitleColor:[UIColor colorWithHexString:@"#2554FF"] forState:UIControlStateNormal];
        _singInButton.backgroundColor = [UIColor whiteColor];
        [_singInButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        _singInButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _singInButton;
}
//内容label
- (UILabel *)messageLabel {
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.text = @"教师专业发展平台用户可使用平台账号登陆";
        _messageLabel.textColor = [UIColor commonColorWithSixNine];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont systemFontOfSize:13];
    }
    return _messageLabel;
}
- (UIView *)forgetView {
    if (_forgetView == nil) {
        _forgetView = [[UIView alloc] init];
        
        UILabel *line = [[UILabel alloc] init];
        line.backgroundColor = [UIColor colorWithHexString:@"#D4D4D4"];
        line.frame = CGRectMake(0, 15, 1, 15);
        
        UILabel *forgetLabel = [[UILabel alloc] init];
        forgetLabel.textColor = [UIColor commonColorWithSixSix];
        forgetLabel.text = @"忘记密码";
        forgetLabel.font = [UIFont systemFontOfSize:15.0];
        forgetLabel.frame = CGRectMake(11, 12, 65, 21);
        
        [_forgetView addSubview:line];
        [_forgetView addSubview:forgetLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickForgetPasswordView)];
        [_forgetView addGestureRecognizer:tap];
        _forgetView.frame = CGRectMake(0, 0, 95, 45);
    }
    return _forgetView;
}

- (UIScrollView *)bottomScrollView {
    if (_bottomScrollView == nil) {
        _bottomScrollView = [[UIScrollView alloc]init];
        _bottomScrollView.frame = CGRectMake(0, 0, Kwidth, Kheight);
        _bottomScrollView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomScrollView;
}
/**
 
 make.centerX.mas_equalTo(self).mas_offset(0);//水平居中
 make.centerY.mas_equalTo(self).mas_offset(0);//垂直居中
 make.top.mas_equalTo(self).mas_offset(166);//距离上方
 make.size.mas_equalTo(CGSizeMake(158, 129));//设置固定大小
 make.bottom.mas_equalTo(self).mas_offset(166);//距离下方
 
 make.top.mas_equalTo(self.userNameTextField.mas_bottom).mas_offset(20);//控件与控件之间的约束
 make.left.and.right.mas_equalTo(self).mas_offset(0);
 
 
 */
//登录
- (void)login{
    NSLog(@"点击了登录");
}
//忘记密码
- (void)clickForgetPasswordView {
    NSLog(@"忘记密码");
}
- (void)addMasonry{
    
    [self.bottomScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(0);
        make.bottom.mas_equalTo(self.view).mas_offset(0);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.right.mas_equalTo(self.view).mas_offset(0);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (Kwidth <= IPhone5Width) {
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(130/ScreenScale);
        }else{
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(130);
        }
        make.centerX.mas_equalTo(self.bottomScrollView).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(107, 107));
    }];
    
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (Kwidth <= IPhone5Width) {
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(345/ScreenScale);
        }else{
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(345);
        }
        
        make.left.mas_equalTo(self.view).mas_offset(15);
        make.right.mas_equalTo(self.view).mas_offset(-15);
        
        make.height.mas_equalTo(45);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (Kwidth <= IPhone5Width) {
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(415/ScreenScale);
        }else{
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(415);
        }
        
        
        make.left.mas_equalTo(self.view).mas_offset(15);
        make.right.mas_equalTo(self.view).mas_offset(-15);
        
        make.height.mas_equalTo(45);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        if (Kwidth <= IPhone5Width) {
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(485/ScreenScale);
        }else{
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(485);
        }
        
        
        make.left.mas_equalTo(self.bottomScrollView).mas_offset(15);
        make.width.mas_equalTo(self.userNameTextField.mas_width);
        make.height.mas_equalTo(self.userNameTextField.mas_height);
        
        
    }];
    
    [self.singInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if (Kwidth <= IPhone5Width) {
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(555/ScreenScale);
        }else{
            make.top.mas_equalTo(self.bottomScrollView).mas_offset(555);
        }
        
        
        make.centerX.mas_equalTo(self.bottomScrollView).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 20));
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        if (Kwidth <= IPhone5Width) {
            make.bottom.mas_equalTo(self.view).mas_offset(-15/ScreenScale);
        }else{
            make.bottom.mas_equalTo(self.view).mas_offset(-15);
        }
        
        
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 45));
        make.centerX.mas_equalTo(self.bottomScrollView).mas_offset(0);
        
    }];
    
}


//点击任意地方隐藏键盘
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                    [self.bottomScrollView setContentOffset:CGPointMake(0,self.setContent) animated:YES];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                    [self.bottomScrollView setContentOffset:CGPointMake(0,0) animated:YES];
                }];
}
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
