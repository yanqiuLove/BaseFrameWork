//
//  NSString+Util.m
//  SanChiStudent
//
//  Created by xhwl on 16/8/16.
//  Copyright © 2016年 学会未来. All rights reserved.
//

#import "NSString+Util.h"

#define NUMBERS @"0123456789"
@implementation NSString (Util)

- (CGSize)textSizeWithRenderSize:(CGSize)textSize andFont:(UIFont *)font andParagraphStyle:(NSParagraphStyle *) style{
    if(self && self.length>0){
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
        CGSize size = [self boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        return size;
    }
    return CGSizeMake(0, 0);
}

- (CGSize)textSizeWithRenderSize:(CGSize)textSize andFont:(UIFont *)font {
    return [self textSizeWithRenderSize:textSize andFont:font andParagraphStyle:[NSMutableParagraphStyle defaultParagraphStyle]];
}

- (CGSize)textFinalSizeWithRenderSize:(CGSize)textSize andFont:(UIFont *)font {
    CGSize finalSize = [self textSizeWithRenderSize:textSize andFont:font];
    return CGSizeMake(finalSize.width+4, finalSize.height+4);
}

#pragma mark - 文档目录
- (NSString *)appendDocumentDir {
    return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
}
- (NSString *)appendCacheDir {
    return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]];
}
- (NSString *)appendTempDir {
    return [self appendDir:NSTemporaryDirectory()];
}
/**
 *  将当前字符串拼接到指定目录后面
 *
 *  @param dir 指定目录
 *
 *  @return 拼接好的路径
 */
- (NSString *)appendDir:(NSString *)dir { // docpath
    return [dir stringByAppendingPathComponent:self];
}

/**
 *  创建文件夹
 *  参数：目标文件夹名字
 *  不存在则创建
 */
+ (void)creatFolderIfNotExits:(NSString *)folderName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:folderName]){
        [fileManager createDirectoryAtPath:folderName withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

#pragma mark - 聊天时间格式化
+ (NSString *)showTime:(NSTimeInterval)msglastTime showDetail:(BOOL)showDetail {
    // 今天的时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:msglastTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    if ([date isToday]) { // 今天
        return [NSDate formate:date];
    } else if ([date isYesterday]) { // 昨天
        return [NSString stringWithFormat:@"昨天 %@",[NSDate formate:date]];
    } else if ([date isThisYear]) {
        formatter.dateFormat = @"MM月dd日";
        return [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:date],[NSDate formate:date]];
    } else {
        formatter.dateFormat = @"yy年MM月dd日";
        return [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:date],[NSDate formate:date]];
    }
}

+ (NSString *)getPeriodOfTime:(NSInteger)time withMinute:(NSInteger)minute {
    NSInteger totalMin = time *60 + minute;
    NSString *showPeriodOfTime = @"";
    if (totalMin > 0 && totalMin <= 5 * 60) {
        showPeriodOfTime = @"凌晨";
    } else if (totalMin > 5 * 60 && totalMin < 12 * 60) {
        showPeriodOfTime = @"上午";
    } else if (totalMin >= 12 * 60 && totalMin <= 18 * 60) {
        showPeriodOfTime = @"下午";
    } else if ((totalMin > 18 * 60 && totalMin <= (23 * 60 + 59)) || totalMin == 0) {
        showPeriodOfTime = @"晚上";
    }
    
    return showPeriodOfTime;
}
+ (NSString *)weekdayStr:(NSInteger)dayOfWeek {
    static NSDictionary *daysOfWeekDict = nil;
    daysOfWeekDict = @{@(1):@"星期日",
                       @(2):@"星期一",
                       @(3):@"星期二",
                       @(4):@"星期三",
                       @(5):@"星期四",
                       @(6):@"星期五",
                       @(7):@"星期六",};
    return [daysOfWeekDict objectForKey:@(dayOfWeek)];
}
+ (NSString *)formartCutdownTimer:(NSString *)timeString {
    NSTimeInterval timeInterval = [timeString longLongValue];
    timeInterval = timeInterval;
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    // 大于1天显示天
    if (days >= 1) {
        return [NSString stringWithFormat:@"(%dd后)",days];
    }
    if (hours>= 1) {
        return [NSString stringWithFormat:@"(%dh后)",hours];
    }
    if (minutes>= 1) {
        return [NSString stringWithFormat:@"(%dm后)",minutes];
    }
    if (seconds>= 1) {
        return [NSString stringWithFormat:@"(%ds后)",seconds];
    }
    
    return nil;
    
    
//
//    // 大于1天显示天
//    if (days >= 1) {
//        return [NSString stringWithFormat:@"距离观课还有 %d天",days];
//    }
//
//    NSString *hoursStr = [NSString stringWithFormat:@"%02d",hours];
//    NSString *minutesStr = [NSString stringWithFormat:@"%02d",minutes];
//    NSString *secondsStr = [NSString stringWithFormat:@"%02d",seconds];
//
//    if (hours<=0&&minutes<=0&&seconds<=0) {
//        return @"";
//    }
//    return [NSString stringWithFormat:@"距离观课还有 %@:%@:%@",hoursStr , minutesStr,secondsStr];
}

#pragma mark - string
/**
 *  将汉字转换为对应的拼音首字母并转为大写
 */
+ (NSString *)phonetic:(NSString *)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    if(source && sourceString.length>0) {
        CFRange range = CFRangeMake(0, 1);
        CFStringTransform((__bridge CFMutableStringRef)source, &range, kCFStringTransformMandarinLatin, NO);
        
        CFStringTransform((__bridge CFMutableStringRef)source, &range, kCFStringTransformStripDiacritics, NO);
        NSString *phonetic = source;
        phonetic = [phonetic substringToIndex:1];
        phonetic = [phonetic uppercaseString];
        int temp = [phonetic characterAtIndex:0];
        
        if (temp < 65 || temp > 122 || (temp > 90 && temp < 97)) {
            //不合法的title
            phonetic = @"#";
        } else {
            phonetic = phonetic;
        }
        return phonetic;
    } else {
        return @"#";
    }
}

+ (BOOL)match:(NSString *)pattern text:(NSString *)text{
    // 1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    // 2.测试字符串
    NSArray *results = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    
    return results.count > 0;
}

+ (NSString *)sc_stringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}
+ (NSInteger)currentTimeSinceEndTime:(NSString *)endtime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *start_date = [NSDate date];
    NSDate *end_date = [formatter dateFromString:endtime];
    NSTimeInterval start_interval = start_date.timeIntervalSince1970;
    NSTimeInterval end_interval = end_date.timeIntervalSince1970;

    NSTimeInterval value = end_interval-start_interval;
    if (value < 0) {
        return 0;
    }
    return value;
}
/**
 *  到观课结束还有多少时间  由于需要前后都推迟5分钟 所以在这个方法里需要开始时间减去5分钟
 */
+ (NSInteger)currentTimeSinceEndTime:(NSString *)endtime cutTime:(NSInteger)cutTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *start_date = [[NSDate date] dateByAddingTimeInterval:cutTime];
    NSDate *end_date = [formatter dateFromString:endtime];
    NSTimeInterval start_interval = start_date.timeIntervalSince1970;
    NSTimeInterval end_interval = end_date.timeIntervalSince1970;
    
    NSTimeInterval value = end_interval-start_interval;
    if (value < 0) {
        return 0;
    }
    return value;
}
/**
 *  根据字符串返回年月日
 */
- (NSString *)getYearMonthAndDay {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
    NSDate *date = [formatter dateFromString:self];
    
    NSDateFormatter *yearFormatter = [[NSDateFormatter alloc] init];
    yearFormatter.dateFormat = @"yyyy年MM月dd日";
    NSString *string = [yearFormatter stringFromDate:date];
    
    return string;
}
/**
 *  返回当前时间
 *  2017.12.29 15:11
 */
+ (NSString *)getCurrentYearMonthAndDay {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY.MM.dd HH:mm"];
    NSDate *date = [NSDate date];
    NSString *string = [formatter stringFromDate:date];
    
    return string;
}
/**
 *  根据状态码返回汉字
 */
+ (NSString *)sc_stateWithNumberString:(NSString *)str{
    NSString *textString = str;
    if ([textString isEqualToString:@"1"]) {
        textString = @"未参会";
    }else if ([textString isEqualToString:@"2"]){
        textString = @"已参会";
    }else if ([textString isEqualToString:@"3"]){
        textString = @"待回执";
    }else if ([textString isEqualToString:@"4"]){
        textString = @"已回执";
    }
    return textString;
}
/**
 *  根据数字返回大写汉字
 */
+ (NSString *)sc_numberStringToHanzi:(NSString *)str {
    NSString *textString = str;
    if ([@"1" isEqualToString:textString]) {
        textString = @"一";
    } else if ([@"2" isEqualToString:textString]){
        textString = @"二";
    } else if ([@"3" isEqualToString:textString]){
        textString = @"三";
    } else if ([@"4" isEqualToString:textString]){
        textString = @"四";
    }
    
    return textString;
}

/**
 *  手机号是否合法
 */
- (BOOL)phoneNumberIsMatch {
//    NSString *phoneRegex = @"[1][3578]\\d{9}";
//    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9])|(170))\\d{8}$";
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [pred evaluateWithObject:self];
}

/**
 *  是否是相同一类型的字符
 */

+ (BOOL)stringIsSameTypeString:(NSString *)string
{
    [string filterFirstAndLastSpace];
    
    NSString *allIntString = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    NSString *allCharString = [string stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]];
    NSString *regex = @"[~`!@#$%^&*()_+-=[]|{};':\",./<>?]{,}/";//规定的特殊字符，可以自己随意添加
    //计算字符串长度
    NSInteger str_length = [string length];
    NSInteger allIndex = 0;
    for (int i = 0; i<str_length; i++) {
        //取出i
        NSString *subStr = [string substringWithRange:NSMakeRange(i, 1)];
        if([regex rangeOfString:subStr].location != NSNotFound)
        {  //存在
            allIndex++;
        }
    }
    if (str_length == allIndex || allIntString.length <= 0 || allCharString.length <= 0 || string.length < 6 || string.length > 20) {
        //单一类型的
        return YES;
    }else {
        //非纯特殊字符
        return NO;
    }
}


/**
 数字转字符串
 
 @param number 1
 @return "一"
 */
+ (NSString *)intToString:(int)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithInt:number]];
    
    return string;
}

/**
 *  格式化会员报告url
 *  返回格式：
 *  没有token加token
 *  没有域名加域名
 */
- (NSString *)verifyMemberReportUrl {
    if ([NSObject isEmpty:self]) {
        return nil;
    }
    
    NSString *resultUrl = @"";
    
    // 是否以http://开头，是说明是全路径
    if ([self hasPrefix:@"http://"]) {
        // 没有token说明需要拼接token
        if (![self containsString:@"token="]) {
//            resultUrl = [NSString stringWithFormat:@"%@?token=%@",self,[AccountTools account].token];
        } else {
            // 完整路径,直接加载
            resultUrl = self;
        }
    } else {
        // 说明只有半截url，需要拼接域名和token
        if (![self containsString:@"token="]) {
//            resultUrl = [NSString stringWithFormat:@"%@%@?token=%@",@"http://vip.sanchijiangtai.com",self,[AccountTools account].token];
        } else { // 有token需要拼接域名
            resultUrl = [NSString stringWithFormat:@"%@%@",@"http://vip.sanchijiangtai.com",self];
        }
    }
    
    return resultUrl;
}
- (NSString *)verifySanchiReportUrl {
    NSString *reportUrl = nil;
    if ([NSObject isNotEmpty:self]) {
        // 是否以http://开头，是说明是全路径
        if ([self hasPrefix:@"http://"]) {
            // 没有token说明需要拼接token
            if (![self containsString:@"token="]) {
//                reportUrl = [NSString stringWithFormat:@"%@?token=%@",self,[AccountTools account].token];
            } else {
                // 完整路径,直接加载
                reportUrl = self;
            }
        } else {
            // 说明只有半截url，需要拼接域名和token
            if (![self containsString:@"token="]) {
//                reportUrl = [NSString stringWithFormat:@"%@%@?token=%@",SCTeacherBaseURL,self,[AccountTools account].token];
            } else { // 有token需要拼接域名
//                reportUrl = [NSString stringWithFormat:@"%@%@",SCTeacherBaseURL,self];
            }
        }
    }
    return reportUrl;
}

/** 验证邮政编码 */
+ (BOOL)clickZipCode:(NSString *)string{
    
    if ([NSObject isEmpty:string]) {
        return NO;
    }
    if (string.length != 6) {
        return NO;
    }
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
    
}

/** 设置属性字符串行间距 */
- (NSMutableAttributedString *)adjustLineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

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
/** 过滤字符串空格和换行 */
- (NSString *)filterSpaceAndLine
{
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}
/** 过滤字符串空格 */
- (NSString *)filterSpace{
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];  //去除掉首尾的空白字符和换行字符
    newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newString;
}
/** 过滤首尾空格 */
- (NSString *)filterFirstAndLastSpace {
    NSString *newString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];  //去除掉首尾的空白字符和换行字符
    newString = [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return newString;
}
/** 根据状态码返回展示教师或者是会员 */
+ (NSString *)showTitle {
    NSString *title = @"";
//    NSString *payWayStr = [[NSUserDefaults standardUserDefaults]objectForKey:ShowPayWayKey];
//    if ([payWayStr isEqualToString:ChoosePayStatus_web]){
//        title = @"教师";
//    }else if ([payWayStr isEqualToString:ChoosePayStatus_ios]) {
//        title = @"会员";
//    }
    return title;
}


@end
