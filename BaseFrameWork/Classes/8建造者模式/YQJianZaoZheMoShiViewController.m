//
//  YQJianZaoZheMoShiViewController.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/9/19.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQJianZaoZheMoShiViewController.h"
#import "YQBuilderProtocol.h"
#import "YQBuilderPersonManager.h"
#import "YQPersonThinBuilder.h"
#import "YQPersonFatBuilder.h"

@interface YQJianZaoZheMoShiViewController ()

@property(nonatomic,strong) UIButton *builderThinPersonButon;
@property(nonatomic,strong) UIButton *builderFatPersonButon;

@end

/** 
 
 1.首先需要定义一个建造小人的协议，协议里定义建造一个完整的对象最终需要完成的所有流程即方法
 2.对于建造不同种类的小人可以每一种小人就键一个类  这样建造不同种类的时候业务逻辑不会冲突(一个制造旁人的类一个制造瘦子的类)  分别实现协议中的方法去建造不同的小人
 3.对于建造的小人有胳膊有腿，同样为了避免逻辑上的冲突或者一个类过于庞大就把每一个细节都拆分单独完成，即制造胳膊的就单独拎出来一个类只建造胳膊，单一原则，这些零件类可以归纳到工具类里边，当然具体的每一个类可以添加对应的方法完成各自的任务，在两种不同小人的类中初始化这些工具类，分别调用这些工具类的制造方法来完成每一个部分的具体制造
 4.在控制器中只需要给指挥者的建造者属性赋上对应的值即可，具体是建造胖子还是瘦子可以放在管理者里边判断 也可以放在控制器中判断
 
 
 */


@implementation YQJianZaoZheMoShiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.builderThinPersonButon];
    [self.view addSubview:self.builderFatPersonButon];
}

#pragma mark - Action
//通过指挥者创建一个瘦子
- (void)clickBuilderThinPersonButtonAction {
    
    //通过指挥者所指派的执行者的选择可以放在控制器也可以放在指挥者里边  这种是放在外边
    YQBuilderPersonManager *manager = [[YQBuilderPersonManager alloc]init];
    YQBuilderProtocol builder = [[YQPersonThinBuilder alloc]init];
    manager.personBuilder = builder;
    [manager buildPerson];
    
    
    
    //通过指挥者所指派的执行者的选择可以放在控制器也可以放在指挥者里边  这种是放在里边
//    YQBuilderPersonManager *personManager = [[YQBuilderPersonManager alloc]init];
//    personManager.builderPersonType = BuilderPersonType_thin;
}
//通过指挥者创建一个胖子
- (void)clickBuilderFatPersonButtonAction {
    
    //通过指挥者所指派的执行者的选择可以放在控制器也可以放在指挥者里边  这种是放在外边
    YQBuilderPersonManager *manager = [[YQBuilderPersonManager alloc]init];
    YQBuilderProtocol builder = [[YQPersonFatBuilder alloc]init];
    manager.personBuilder = builder;
    [manager buildPerson];
    
    
//    YQBuilderPersonManager *personManager = [[YQBuilderPersonManager alloc]init];
//    personManager.builderPersonType = BuilderPersonType_fat;
}
- (UIButton *)builderThinPersonButon {
    if (_builderThinPersonButon == nil) {
        _builderThinPersonButon = [[UIButton alloc]init];
        _builderThinPersonButon.frame = CGRectMake(0, 200, Kwidth, 60);
        _builderThinPersonButon.titleLabel.font = [UIFont systemFontOfSize:17];
        [_builderThinPersonButon setTitle:@"创建一个瘦子" forState:UIControlStateNormal];
        [_builderThinPersonButon setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
        [_builderThinPersonButon addTarget:self action:@selector(clickBuilderThinPersonButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _builderThinPersonButon;
}

- (UIButton *)builderFatPersonButon {
    if (_builderFatPersonButon == nil) {
        _builderFatPersonButon = [[UIButton alloc]init];
        _builderFatPersonButon.frame = CGRectMake(0, 300, Kwidth, 60);
        _builderFatPersonButon.titleLabel.font = [UIFont systemFontOfSize:17];
        [_builderFatPersonButon setTitle:@"创建一个胖子" forState:UIControlStateNormal];
        [_builderFatPersonButon setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
        [_builderFatPersonButon addTarget:self action:@selector(clickBuilderFatPersonButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _builderFatPersonButon;
}


@end
