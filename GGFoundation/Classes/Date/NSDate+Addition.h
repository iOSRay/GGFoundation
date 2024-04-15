//
//  NSDate+Addition.h
//  Beansmile
//
//  Created by John on 16/1/11.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

+ (NSString *)localTimestampString;

+ (NSString *)localTimestampString13;

- (NSDate *)toLocalTime;

//传入秒得到 xx:xx:xx
+ (NSString *)getMMSSFromSS:(NSInteger)seconds;

// 获取系统运行时间，https://stackoverflow.com/questions/12488481/getting-ios-system-uptime-that-doesnt-pause-when-asleep
+ (NSTimeInterval)uptime;

@end
