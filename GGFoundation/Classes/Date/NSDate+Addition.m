//
//  NSDate+Addition.m
//  Beansmile
//
//  Created by John on 16/1/11.
//
//

#import "NSDate+Addition.h"
#import "sys/sysctl.h"

@implementation NSDate (Addition)

+ (NSString *)localTimestampString {
    NSDate *date = [[NSDate date] toLocalTime];
    return @(@([date timeIntervalSince1970]).integerValue).stringValue;
}

+ (NSString *)localTimestampString13 {
    NSDate *date = [[NSDate date] toLocalTime];
    return @(@([date timeIntervalSince1970]).integerValue*1000).stringValue;
}

- (NSDate *)toLocalTime {
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

//传入秒得到 xx:xx:xx
+ (NSString *)getMMSSFromSS:(NSInteger)seconds {
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    if (seconds >= 3600) {
        return [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    } else {
        return [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    }
}

/*
 get system uptime since last boot
 gettimeofday 和 sysctl 都会受系统时间影响，但他们二者做一个减法所得的值，就和系统时间无关了。这样就可以避免用户修改时间了。
 当然用户如果关机，过段时间再开机，会导致我们获取到的时间慢与服务器时间，真实场景中，慢于服务器时间往往影响较小，我们一般担心的是客户端时间快于服务器时间
 */
+ (NSTimeInterval)uptime {
    struct timeval boottime;
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    size_t size = sizeof(boottime);
    struct timeval now;
    struct timezone tz;
    gettimeofday(&now, &tz);
    double uptime = -1;
    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0) {
        uptime = now.tv_sec - boottime.tv_sec;
        uptime += (double)(now.tv_usec - boottime.tv_usec) / 1000000.0;
    }
    return uptime;
}

@end
