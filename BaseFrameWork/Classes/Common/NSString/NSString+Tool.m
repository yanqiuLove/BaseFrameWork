//
//  NSString+Tool.m
//  iFHDoctor
//
//  Created by luozhiping on 15/3/30.
//  Copyright (c) 2015年 fh21. All rights reserved.
//

#import "NSString+Tool.h"
#define NUMBERS @"0123456789"
@implementation NSString (Tool)
+ (NSString *)caculateReallyDateWithReplyDateString:(NSString *)dateString
{
    return [[self alloc] caculateDate:dateString];
}

+ (NSString *)caculateReallyDateNoHourWithReplyDateString:(NSString *)dateString
{
    return [[self alloc] caculateDateNoHour:dateString];
}

- (NSString *)caculateDate:(NSString *)dateString
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateString doubleValue]];
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *confromTimespString=[format stringFromDate:confromTimesp];
    
    NSTimeInterval Today= [self nowTime:nil];//今天凌晨的时间
    
    NSDateFormatter *formate=[[NSDateFormatter alloc] init];
    
    [formate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date=[formate dateFromString:confromTimespString];
    
    NSTimeInterval late=[date timeIntervalSince1970] * 1;
    
    NSTimeInterval interval=late-Today;
    
    NSString *finallyDate = nil;
    
    if (interval>=0 ) {
        
        finallyDate = [NSString stringWithFormat:@"今天 %@",[confromTimespString substringWithRange:NSMakeRange(11,8)]];
        
        return finallyDate;
    }else if (interval > -60*60*24 && interval <0){
        
        finallyDate = [NSString stringWithFormat:@"昨天 %@",[confromTimespString substringWithRange:NSMakeRange(11,8)]];
        
        return finallyDate;
    }else{
        return confromTimespString;
    }
}

- (NSString *)caculateDateNoHour:(NSString *)dateString
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateString doubleValue]];
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *confromTimespString=[format stringFromDate:confromTimesp];
    
    NSTimeInterval Today= [self nowTime:nil];//今天凌晨的时间
    
    NSDateFormatter *formate=[[NSDateFormatter alloc] init];
    
    [formate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date=[formate dateFromString:confromTimespString];
    
    NSTimeInterval late=[date timeIntervalSince1970] * 1;
    
    NSTimeInterval interval=late-Today;
    
    NSString *finallyDate = nil;
    
    if (interval>=0 ) {
        
        finallyDate = [NSString stringWithFormat:@"%@",[confromTimespString substringWithRange:NSMakeRange(11,8)]];
        
        return finallyDate;
    }else if (interval > -60*60*24 && interval <0){
        
        finallyDate = [NSString stringWithFormat:@"昨天 %@",[confromTimespString substringWithRange:NSMakeRange(11,8)]];
        
        return finallyDate;
    }else{
        [format setDateFormat:@"yy/MM/dd"];
        confromTimespString = [format stringFromDate:confromTimesp];
        return confromTimespString;
    }
}

#pragma mark 判断传入日期的凌晨秒数----传入时间为空时候,是当天凌晨的秒数
-(NSTimeInterval)nowTime:(NSDate*)date
{
    if (!date) {
        date=[NSDate new];
    }
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT +8"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierChinese];
    
    [gregorian setTimeZone:gmt];
    
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate:date];
    
    [components setHour:0];
    
    [components setMinute:0];
    
    [components setSecond: 0];
    
    NSDate *newDate = [gregorian dateFromComponents: components];
    
    NSTimeInterval late=[newDate timeIntervalSince1970]*1;
    
    return late;
}

+ (NSString *)covertStampToDate:(NSString *)stamp
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[stamp doubleValue]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *date = [formatter stringFromDate:confromTimesp];
    
    return date;
}

+ (NSMutableAttributedString *)convertToColor:(UIColor *)color withString:(NSString *)string andSearchString:(NSString *)searchStr {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:string];
    
    NSRange range = [mutableStr rangeOfString:searchStr options:NSCaseInsensitiveSearch];
    NSInteger kPad = 0;

    while (range.location != NSNotFound) {
        
        [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(range.location + kPad, range.length)];
        NSInteger count = range.location + range.length;
        mutableStr = [[NSMutableString alloc] initWithString:[mutableStr substringFromIndex:count]];
        kPad += (range.location + range.length);
        range = [mutableStr rangeOfString:searchStr options:NSCaseInsensitiveSearch];

    }
    
    return attributeStr;
}

+ (NSString *)deltaWithNow:(NSString *)timeInterval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval.doubleValue];
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *confromTimespString=[format stringFromDate:date];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unit fromDate:date toDate:[NSDate date] options:0];
    
//    NSLog(@"day:%ld hours:%ld minute:%ld",components.day,components.hour,components.minute);
    
    if (components.day > 5) {
        return confromTimespString;
    }else if (components.day >= 1 && components.day <= 5){
        return [NSString stringWithFormat:@"%ld天前",(long)components.day];
    }else if (components.hour >= 1 && components.day < 1){
        return [NSString stringWithFormat:@"%ld小时前",(long)components.hour];
    }else{
        return (components.minute < 1) ? @"刚刚" : [NSString stringWithFormat:@"%ld分钟前",(long)components.minute];
    }
}

/**
 *  @return NSString 获取显示的时间 几天几小时几分钟
 *  @param 分钟数
 */
+ (NSString *)hotListPhoneTimeFormatedWithMinniuteTime:(NSString *)minuteTime
{
    NSInteger timeFloat = minuteTime.integerValue;
    
    NSInteger days;
    NSInteger hours;
    NSInteger minutes;
    
    days = timeFloat/(60*24);
    hours = timeFloat%(60*24)/60;
    minutes = timeFloat%60;
    
    NSString *daysString = days > 0 ? [NSString stringWithFormat:@"%ld天",(long)days] : @"";
    NSString *hoursString = hours > 0 ? [NSString stringWithFormat:@"%ld小时",(long)hours] : @"";
    NSString *minutesString = minutes > 0 ? [NSString stringWithFormat:@"%ld分钟",(long)minutes] : @"";
    
    if(minuteTime.integerValue == 0) {
       minutesString = @"0分钟";
    }
    
    
    return [NSString stringWithFormat:@"%@%@%@",daysString,hoursString,minutesString];
    
}

- (NSString *)filterSpaceAndLine
{
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}

- (NSString *)filterSpace{
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];  //去除掉首尾的空白字符和换行字符
    newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newString;
}

- (NSString *)filterFirstAndLastSpace {
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];  //去除掉首尾的空白字符和换行字符
    newString = [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return newString;
}
@end
