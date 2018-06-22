//
//  YQOperationModelViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/25.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQOperationModelViewController.h"
#import "YQModelViewController.h"
#import "YQOperationModelCell.h"
#import "YQCeShiModel.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface YQOperationModelViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property(nonatomic,strong) UITableView *tableView;
/** 数据源 */
@property(nonatomic,strong) NSMutableArray *dataArray;

@end
static NSString *cellIdentifier = @"YQOperationModelCell";
@implementation YQOperationModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个tableview 点击某一个cell跳转到YQModelViewCOntroller
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArray = [YQCeShiModel getYQCeShiModelArray];
    YQCeShiModel *model = [self.dataArray objectAtIndex:8];
    model.whetherSelected = YES;
    [self.view addSubview:self.tableView];
    
    self.tableView.fd_debugLogEnabled = YES;
    [self.tableView registerClass:[YQOperationModelCell class] forCellReuseIdentifier:cellIdentifier];
    
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    YQOperationModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[YQOperationModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    YQCeShiModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.ceShimodel = model;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    YQCeShiModel *model = [self.dataArray objectAtIndex:indexPath.row];
//    return model.cellHeight;
    CGFloat hhh = [self.tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByKey:indexPath configuration:^(YQOperationModelCell *cell) {
        
        cell.ceShimodel = self.dataArray[indexPath.row];
    }];
    NSLog(@"实际高度==========%f",hhh);
    return hhh;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YQModelViewController *vc = [[YQModelViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - Lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight)];
        //隐藏分割线
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //这个是取消cell的选中效果需要放在cell的初始化方法里
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
