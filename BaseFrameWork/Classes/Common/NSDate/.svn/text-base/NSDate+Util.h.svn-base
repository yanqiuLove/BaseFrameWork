//
//  NSDate+Util.h
//  SanChiStudent
//
//  Created by xhwl on 16/10/25.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Util)

+(NSDateFormatter*) sharedFormatter;
+(NSDateFormatter*) sharedFormatter:(NSString*) formatter;

+(NSString*) formate:(NSDate*) date;
//根据date格式化
+(NSString*) formate:(NSDate*) date withFormat:(NSString*) format;

//返回两个date之间的间隔天数
+(NSInteger) dayIntervalSinceDate:(NSDate*)sinceDate toDate:(NSDate*) toDate;

//返回time的秒，类型是NSInteger
-(long long) timeSecondsSince1970;
//根据毫秒返回对应的时间
+(NSDate*) dateWithTimeMillisSince1970:(long long) timeMillis;
//返回date的毫秒数
-(long long) timeMillisSince1970;


/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;
/**
 *  是否本周内
 */
-(BOOL)isThisWeek;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

@end
