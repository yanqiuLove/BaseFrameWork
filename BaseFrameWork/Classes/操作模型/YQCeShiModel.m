//
//  YQCeShiModel.m
//  BaseFrameWork
//
//  Created by 赵晚秋 on 2017/7/25.
//  Copyright © 2017年 赵晚秋. All rights reserved.
//

#import "YQCeShiModel.h"

@implementation YQCeShiModel

+ (YQCeShiModel *)yqCeShiModelWithName:(NSString *)name sex:(NSString *)sex age:(NSString *)age {
    YQCeShiModel *model = [[YQCeShiModel alloc]init];
    model.name = name;
    model.sex = sex;
    model.age = age;
    return model;
}


+ (NSMutableArray *)getYQCeShiModelArray {
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i++) {
        NSString *sexStr = @"男";
        if (i%2 == 0) {
            sexStr = @"女";
        }
        YQCeShiModel *model = [YQCeShiModel yqCeShiModelWithName:[NSString stringWithFormat:@"名字%ld",i + 1] sex:sexStr age:@"20"];
        [array addObject:model];
    }
    return array;

}
- (CGFloat)cellHeight {
    if (_cellHeight == 0) {
//        int x = 60 + arc4random() % 30;
//        _cellHeight = x;
//        CGSize suze = [self.name textFinalSizeWithRenderSize:CGSizeMake(300, 100) andFont:[UIFont systemFontOfSize:14.0]];
//        _cellHeight = suze.height;
//        _cellHeight = 60;
    }
    return _cellHeight;
}
- (NSMutableAttributedString *)adjustLineSpaceWithString:(NSString *)str{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    return attributedString;
}

@end
