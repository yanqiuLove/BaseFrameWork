//
//  CCMoveLabelView.m
//  Cece
//
//  Created by 依小窗 on 2018/11/18.
//

#import "CCMoveLabelView.h"
#import <JhtMarquee/JhtVerticalMarquee.h>
#import <JhtMarquee/JhtHorizontalMarquee.h>
#import "CCScrollViewLabel.h"

@interface CCMoveLabelView () {
    JhtHorizontalMarquee *_horizontalMarquee;
}

@end

@implementation CCMoveLabelView

- (void)setTitleStr:(NSString *)titleStr {
    // 为了区分一次滚动结束 在标题后边拼接一些空格
    NSString *lastStr = [titleStr stringByAppendingString:@"                    "];
    _titleStr = lastStr;
//    _horizontalMarquee = [[JhtHorizontalMarquee alloc] initWithFrame:CGRectMake(60, 0, kScreenWidth-120, kNavBarHeight) singleScrollDuration:0.0];
//    _horizontalMarquee.text = _titleStr;
//    [self addSubview:_horizontalMarquee];
//    // 开启跑马灯
//    [_horizontalMarquee marqueeOfSettingWithState:MarqueeStart_H];
    
    CCScrollViewLabel *scrollViewLabel = [[CCScrollViewLabel alloc]initWithFrame:CGRectMake(60, 0, kScreenWidth - 120, kNavBarHeight)];
    scrollViewLabel.text = _titleStr;
    [self addSubview:scrollViewLabel];
    
}

@end
