//
//  YQTableViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/4/24.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQTableViewController.h"
#import "YQCarModel.h"
#import "YQGrouapModel.h"

@interface YQTableViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property(nonatomic,strong)UITableView *tableView;
/** grouap数组 */
@property(nonatomic,strong)NSArray *grouaps;

@end

@implementation YQTableViewController


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //cell的第二种重用  注册某个标识的cell
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    }
    return _tableView;
}

- (NSArray *)grouaps {
    if (_grouaps == nil) {
        _grouaps = [YQGrouapModel getData];
    }
    return _grouaps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 62; i++) {
        NSString *name = [NSString stringWithFormat:@"refresh%ld",i+1];
        UIImage *image = [UIImage imageNamed:name];
        [imageArray addObject:image];
    }
    
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [header setImages:imageArray forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    self.tableView.mj_header = header;
    
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // Set the refresh image
    [footer setImages:imageArray forState:MJRefreshStateRefreshing];
    footer.stateLabel.hidden = YES;
    footer.refreshingTitleHidden = YES;
    self.tableView.mj_footer = footer;
}
- (void)loadNewData {
    SCLog(@"下拉刷新");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}
- (void)loadMoreData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
    });
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.grouaps.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.grouaps objectAtIndex:section] carsArray].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 最原始的创建cell */
//    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //被static修饰的局部变量只会被初始化一次，在整个程序中只有一份内存
    static NSString *weiyibiaoshi = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:weiyibiaoshi];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weiyibiaoshi];
    }
    cell.textLabel.text = [[[[self.grouaps objectAtIndex:indexPath.section] carsArray] objectAtIndex:indexPath.row] carName];
    cell.imageView.image = [UIImage imageNamed:[[[[self.grouaps objectAtIndex:indexPath.section] carsArray] objectAtIndex:indexPath.row] carIcon]];
    
    return cell;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [[self.grouaps objectAtIndex:section] headerName];
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return [[self.grouaps objectAtIndex:section] footerName];
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
