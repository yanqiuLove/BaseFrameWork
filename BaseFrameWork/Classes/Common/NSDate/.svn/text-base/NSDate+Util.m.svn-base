//
//  NSDate+Util.m
//  SanChiStudent
//
//  Created by xhwl on 16/10/25.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import "NSDate+Util.h"


static NSString *FORMAT_DEFAULT = @"HH:mm";
static NSString *STRING_EMPTY = @"";
static NSDateFormatter* FORMATTER = nil;
@implementation NSDate (Util)

+(NSDateFormatter*) sharedFormatter{
    if(!FORMATTER){
        FORMATTER =[[NSDateFormatter alloc] init];
    }
    FORMATTER.dateFormat = FORMAT_DEFAULT;
    return FORMATTER;
}

+(NSDateFormatter*)sharedFormatter:(NSString*)formatter{
    [NSDate sharedFormatter].dateFormat = formatter;
    return FORMATTER;
}

+(NSString*) formate:(NSDate*) date{
    return [NSDate formate:date withFormat:nil];
}

+(NSString*) formate:(NSDate*) date withFormat:(NSString*) format{
    if(!date){
        return STRING_EMPTY;
    }
    if(!format){
        return [[NSDate sharedFormatter] stringFromDate:date];
    }else {
        return [[NSDate sharedFormatter:format] stringFromDate:date];
    }
}

+(NSInteger) dayIntervalSinceDate:(NSDate*) sinceDate toDate:(NSDate*) toDate{
    double timeInterval = [sinceDate timeIntervalSinceDate:toDate];
    NSInteger dayInterval = (timeInterval/60/60/24);
    
    return dayInterval;
}

-(long long) timeSecondsSince1970{
    long long timeInterval = [self timeIntervalSince1970];
    long long timeSecond = (long long)timeInterval;
    return timeSecond;
}

-(long long) timeMillisSince1970{
    long long timeMillis = [self timeIntervalSince1970] * 1000;
    long long timeInterval = (long long)timeMillis;
    return timeInterval;
}

+(NSDate*) dateWithTimeMillisSince1970:(long long) timeMillis{
    double timeSeconds = timeMillis / 1000;
    return [NSDate dateWithTimeIntervalSince1970:timeSeconds];
}

/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday {
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (BOOL)isThisWeek {
    
    NSDate *start;
    NSTimeInterval extends;
    
    NSCalendar *cal=[NSCalendar autoupdatingCurrentCalendar];
    NSDate *today=[NSDate date];
    
    BOOL success= [cal rangeOfUnit:NSCalendarUnitWeekday startDate:&start interval: &extends forDate:today];
    
    if(!success)
        return NO;
    
    NSTimeInterval dateInSecs = [self timeIntervalSinceReferenceDate];
    NSTimeInterval dayStartInSecs= [start timeIntervalSinceReferenceDate];
    
    if(dateInSecs > dayStartInSecs && dateInSecs < (dayStartInSecs+extends)){
        return YES;
    }
    else {
        return NO;
    }
}
- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}


@end
