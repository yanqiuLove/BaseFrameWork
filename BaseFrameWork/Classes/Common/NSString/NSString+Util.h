//
//  NSString+Util.h
//  SanChiStudent
//
//  Created by xhwl on 16/8/16.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Util)

/**
 *  计算文字大小
 */
- (CGSize)textSizeWithRenderSize:(CGSize)textSize andFont:(UIFont *)font;
/**
 *  计算文字大小
 *  高度已经加4
 */
- (CGSize)textFinalSizeWithRenderSize:(CGSize)textSize andFont:(UIFont *)font;

#pragma mark - 沙河目录
/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir;

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir;

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir;

/**
 *  创建文件夹
 *  参数：目标文件夹名字
 *  不存在则创建
 */
+ (void)creatFolderIfNotExits:(NSString *)folderName;

#pragma mark - 聊天时间格式化
+ (NSString *)showTime:(NSTimeInterval)msglastTime showDetail:(BOOL)showDetail;

/**
 *  将汉字转换为对应的拼音首字母并转为大写
 */
+ (NSString *)phonetic:(NSString *)sourceString;

+ (NSString *)formartCutdownTimer:(NSString *)timeString;

#pragma maark - 正则表达式
+ (BOOL)match:(NSString *)pattern text:(NSString *)text;


/**
 *  打印时间
 */
+ (NSString *)sc_stringDate;
/**
 *  到此时间还有多少秒
 */
+ (NSInteger)currentTimeSinceEndTime:(NSString *)endtime;
/**
 *  到观课结束还有多少时间  由于需要前后都推迟5分钟 所以在这个方法里需要开始时间减去5分钟
 */
+ (NSInteger)currentTimeSinceEndTime:(NSString *)endtime cutTime:(NSInteger)cutTime;
/**
 *  根据字符串返回年月日
 */
- (NSString *)getYearMonthAndDay;
/**
 *  返回当前时间
 *  2017.12.29 15:11
 */
+ (NSString *)getCurrentYearMonthAndDay;
/**
 *  根据状态码返回汉字
 */
+ (NSString *)sc_stateWithNumberString:(NSString *)str;
/**
 *  根据数字返回大写汉字
 */
+ (NSString *)sc_numberStringToHanzi:(NSString *)str;

/**
 *  手机号是否合法
 */
- (BOOL)phoneNumberIsMatch;


/**
 *  是否是相同一类型的字符
 */
+ (BOOL)stringIsSameTypeString:(NSString *)string;

/**
 数字转字符串
 
 @param number 1
 @return "一"
 */
+ (NSString *)intToString:(int)number;

/**
 *  格式化会员报告url
 *  返回格式：
 *  没有token加token
 *  没有域名加域名
 */
- (NSString *)verifyMemberReportUrl;

/**
 *  格式化报告url
 *  返回格式：
 *  没有token加token
 *  没有域名加域名
 */
- (NSString *)verifySanchiReportUrl;

/** 验证邮政编码 */
+ (BOOL)clickZipCode:(NSString *)string;

/** 设置属性字符串行间距 */
- (NSMutableAttributedString *)adjustLineSpace:(CGFloat)lineSpace;


/**
 *  根据当前时间和回复时间计算出具体显示时间
 */
+ (NSString *)caculateReallyDateWithReplyDateString:(NSString *)dateString;

/**
 * 时间戳转时间
 */
+ (NSString *)covertStampToDate:(NSString *)stamp;

/**
 *  Zhenfei Ren添加
 *  搜索一个字符串A中的字符串B，然后将所有的A中B的颜色设置为目的颜色
 *
 *  @param color     搜索到的字符串的颜色
 *  @param string    源字符串
 *  @param searchStr 需要搜索的目的字符串
 *
 *  @return 返回带颜色的属性字符串
 */
+ (NSMutableAttributedString *)convertToColor:(UIColor *)color withString:(NSString *)string andSearchString:(NSString *)searchStr;

+ (NSString *)caculateReallyDateNoHourWithReplyDateString:(NSString *)dateString;

/**
 *  获得与当前时间的差距
 */
+ (NSString *)deltaWithNow:(NSString *)timeInterval;
/**
 *  @return 获取显示的时间 几天几小时几分钟
 */
+ (NSString *)hotListPhoneTimeFormatedWithMinniuteTime:(NSString *)minuteTime;

/** 过滤字符串空格和换行 */
- (NSString *)filterSpaceAndLine;

/** 过滤字符串空格 */
- (NSString *)filterSpace;

/** 过滤首尾空格 */
- (NSString *)filterFirstAndLastSpace;

/** 根据状态码返回展示教师或者是会员 */
+ (NSString *)showTitle;

@end
