//
//  YQZiShiYingGaoDuViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2018/1/30.
//  Copyright © 2018年 赵晚秋. All rights reserved.
//

#import "YQZiShiYingGaoDuViewController.h"
#import "YQCellZiShiYingGaoDuCell.h"
#import "YQQQQQQQTestModel.h"

@interface YQZiShiYingGaoDuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *contentArray;

@end

static NSString *cellIdentifier = @"YQCellZiShiYingGaoDuCell";

@implementation YQZiShiYingGaoDuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.tableView];
    
//    self.tableView.estimatedRowHeight = 200;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    NSString *daxie = [NSString formartCutdownTimer:@"2018-02-06 11:22:00"];
    
    SCLog(@"%@",daxie);
    
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YQCellZiShiYingGaoDuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[YQCellZiShiYingGaoDuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random() % 100 / 100.0 green:arc4random() % 100 / 100.0 blue:arc4random() % 100 / 100.0 alpha:1.0];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.contentArray.count;
    return 5;
    
}
#pragma mark - Lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
        [_tableView registerClass:[YQCellZiShiYingGaoDuCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 300;  //  随便设个不那么离谱的值
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

@end
