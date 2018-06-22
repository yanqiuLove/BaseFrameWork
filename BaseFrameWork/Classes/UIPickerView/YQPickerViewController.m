//
//  YQPickerViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/25.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQPickerViewController.h"

@interface YQPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong) NSArray *firstDataArray;
@property(nonatomic,strong) NSArray *secondDataArray;

@property(nonatomic,strong) UILabel *contentLabel;

@property(nonatomic,strong) NSString *firstStr;
@property(nonatomic,strong) NSString *secondStr;

@end

@implementation YQPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.firstDataArray = @[@"北京",@"上海",@"深圳",@"杭州",@"广州"];
    self.secondDataArray = @[@"昌平",@"海淀",@"朝阳",@"丰台",@"亦庄"];
    
    self.firstStr = @"北京";
    self.secondStr = @"昌平";
    
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, Kwidth, 30)];
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.contentLabel];
    
    UITextField *showPickerTextFied = [[UITextField alloc]initWithFrame:CGRectMake(0, 160, Kwidth, 30)];
    showPickerTextFied.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:showPickerTextFied];
    
//    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, Kheight - 180, Kwidth, 180)];
//    pickerView.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
//    pickerView.dataSource = self;
//    pickerView.delegate = self;
//    [self.view addSubview:pickerView];
    
    
    UIView *pickerGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, Kheight - 180, Kwidth, 180)];
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30, Kwidth, 150)];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
    [pickerGroundView addSubview:pickerView];
    
    UIView *tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, 30)];
    tapView.backgroundColor = [UIColor commonColorWithSixNine];
    [pickerGroundView addSubview:tapView];
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 60, 30)];
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(Kwidth - 80, 0, 60, 30)];
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [tapView addSubview:leftButton];
    [tapView addSubview:rightButton];
    
    [self.view addSubview:pickerGroundView];
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstDataArray.count;
    }else {
        return self.secondDataArray.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED {
    
    return Kwidth/2;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component __TVOS_PROHIBITED {
    return 30;
}
//- (UIView *)viewForRow:(NSInteger)row forComponent:(NSInteger)component {
//    UIView *rowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Kwidth/2, 60)];
//    rowView.backgroundColor = [UIColor cyanColor];
//    return rowView;
//}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.firstDataArray objectAtIndex:row];
    }else {
        return [self.secondDataArray objectAtIndex:row];
    }
}
//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) {
//    //返回属性字符串
//}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//    这里可以自定义row的样式
//    UIView *rowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Kwidth/2, 60)];
//    rowView.backgroundColor = [UIColor cyanColor];
//    return rowView;
//}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.firstStr = [self.firstDataArray objectAtIndex:row];
    }else {
        self.secondStr = [self.secondDataArray objectAtIndex:row];
    }
    self.contentLabel.text = [self.firstStr stringByAppendingString:self.secondStr];
}
@end
