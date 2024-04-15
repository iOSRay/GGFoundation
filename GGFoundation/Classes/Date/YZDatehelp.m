//
//  WWDatehelp.m
//  IntelligentBaggage
//
//  Created by John on 2017/3/18.
//

#import "YZDatehelp.h"
#import "NSDate+YZDateTools.h"

//日期格式
#define kDateFormat @"yyyy-MM-dd HH:mm"

@implementation YZDatehelp

+ (NSString *)showHandyDateFromDate:(NSDate *)date{
//    NSString *currentDayString = [date formattedDateWithFormat:@"yyyy-MM-dd"];
//    NSDate *currentDay = [NSDate dateWithString:currentDayString format:@"yyyy-MM-dd"];
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    if ([currentDay isToday]){
//        formatter.dateFormat = @"HH:mm";
//        return [NSString stringWithFormat:@"%@ %@",@"今天",[formatter stringFromDate:date]];
//    }else if ([currentDay isTomorrow]){
//        formatter.dateFormat = @"HH:mm";
//        return [NSString stringWithFormat:@"%@ %@",@"明天",[formatter stringFromDate:date]];
//    }else{
//        formatter.dateFormat = kDateFormat;
//        return [formatter stringFromDate:date];
//    }
    return nil;
}

+ (NSString *)showMonthDateStringFromDate:(NSDate *)date{
    
    NSUInteger yearInteger = [date yearsEarlierThan:[NSDate date]];
    NSString *year = yearInteger == 0?@"":[NSString stringWithFormat:@"%@年",@([date year])];
    NSInteger monthInteger = [date month];
    NSInteger currentMonthInteger = [[NSDate date] month];
    if (yearInteger == 0 && monthInteger == currentMonthInteger) {
        return @"本月";
    }else{
        NSString *month = [NSString stringWithFormat:@"%@%@月",year,@(monthInteger)];
        return month;
    }
}

+ (NSString *)showWeekDateStringFromDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *tmp = @"";
    NSString *week = @"";
    switch (date.weekday) {
        case 1:
            week = [week stringByAppendingString:@"星期天"];
            break;
        case 2:
            week = [week stringByAppendingString:@"星期一"];
            break;
        case 3:
            week = [week stringByAppendingString:@"星期二"];
            break;
        case 4:
            week = [week stringByAppendingString:@"星期三"];
            break;
        case 5:
            week = [week stringByAppendingString:@"星期四"];
            break;
        case 6:
            week = [week stringByAppendingString:@"星期五"];
            break;
        case 7:
            week = [week stringByAppendingString:@"星期六"];
            break;
        default:
            break;
    }

    tmp = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:date],week];
    return tmp;
}

@end
