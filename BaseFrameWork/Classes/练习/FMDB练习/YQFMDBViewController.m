//
//  YQFMDBViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/12/4.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQFMDBViewController.h"
#import "YQDetailViewController.h"
#import "YQDBManager.h"
#import "YQUserModel.h"
#import "YQUserCell.h"


@interface YQFMDBViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;


@end

static NSString *cellIdentifier = @"YQUserCell";

@implementation YQFMDBViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /** 获取数据 */
    NSMutableArray *array = [[YQDBManager sharedDataBase] getAllStudent];
    self.dataArray = [YQUserModel mj_objectArrayWithKeyValuesArray:array];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FMDB";
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(gotoAddPage)];
    self.navigationItem.rightBarButtonItem = right;
    [self.view addSubview:self.tableView];
    [self addMasonry];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (YQUserCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YQUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[YQUserCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    YQUserModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell configModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YQUserModel *model = [self.dataArray objectAtIndex:indexPath.row];
    YQDetailViewController *vc = [[YQDetailViewController alloc]init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle==UITableViewCellEditingStyleDelete) {
        [[YQDBManager sharedDataBase] deleteStudent:[self.dataArray objectAtIndex:indexPath.row]];
        NSMutableArray *array = [[YQDBManager sharedDataBase] getAllStudent];
        self.dataArray = [YQUserModel mj_objectArrayWithKeyValuesArray:array];
    }
    [self.tableView reloadData];
}

-(void)gotoAddPage {
    
    YQDetailViewController *dCtrl=[[YQDetailViewController alloc]init];
    [self.navigationController pushViewController:dCtrl animated:YES];
    
    //添加学生
//    for (NSInteger i = 0; i<10; i++) {
//        YQUserModel *model = [[YQUserModel alloc]init];
//        model.userId = i;
//        model.userName = [NSString stringWithFormat:@"张三%ld",i];
//        model.age = 10 + arc4random() % 11;
//        [[YQDBManager sharedDataBase] addStudent:model];
//    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableArray *array = [[YQDBManager sharedDataBase] getAllStudent];
    self.dataArray = [YQUserModel mj_objectArrayWithKeyValuesArray:array];
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
        //隐藏分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YQUserCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark - 约束
- (void)addMasonry {
 
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(65);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(Kwidth, Kheight - 65));
    }];
    
}


@end
