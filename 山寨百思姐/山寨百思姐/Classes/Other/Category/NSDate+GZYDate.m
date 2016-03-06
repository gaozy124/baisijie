//
//  NSDate+GZYDate.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/3/1.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "NSDate+GZYDate.h"

@implementation NSDate (GZYDate)


+(NSString *)convertDateWithString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *destDate = [dateFormatter dateFromString:dateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if ([self isThisYear:destDate]) {
        
        
        if ([self isYesterday:destDate]) {
            NSDateFormatter *yesterdayFormatter = [[NSDateFormatter alloc] init];
            yesterdayFormatter.dateFormat = @"HH:mm";
            return [NSString stringWithFormat:@"昨天 %@",[yesterdayFormatter stringFromDate:destDate]];
        }else if ([self isToday:destDate]){
            
            NSDateComponents *cmps = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:destDate toDate:[NSDate date] options:0];
            
            if (cmps.hour == 0) {
                
                if (cmps.minute == 0) {
                    return @"刚刚";
                }
                
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            }
            
            NSDateFormatter *todayFormatter = [[NSDateFormatter alloc] init];
            todayFormatter.dateFormat = @"HH:mm";
            return [NSString stringWithFormat:@"今天 %@",[todayFormatter stringFromDate:destDate]];
            
        }
        
        NSDateFormatter *yearFormatter = [[NSDateFormatter alloc] init];
        
        yearFormatter.dateFormat = @"MM月dd日 HH:mm";
      
        return [NSString stringWithFormat:@"%@",[yearFormatter stringFromDate:destDate]];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy年MM月dd日 HH:mm";

    return [NSString stringWithFormat:@"%@",[formatter stringFromDate:destDate]];
    
}

+(BOOL)isThisYear:(NSDate *)destDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
   NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDateComponents *destCmps = [calendar components:NSCalendarUnitYear fromDate:destDate];
    
    if (nowCmps.year == destCmps.year) {
        return YES;
    }
    
    return NO;
}


+(BOOL)isYesterday:(NSDate *)destDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSDate *date = [formatter dateFromString:[formatter stringFromDate:destDate]];
    NSDate *nowDate = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
    
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date toDate:nowDate options:0];
    
    if (cmps.year == 0 && cmps.month == 0 && cmps.day == 1) {
        return YES;
    }
    
    return NO;
}

+(BOOL)isToday:(NSDate *)destDate{
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd";
//    
//    NSString *now = [formatter stringFromDate:[NSDate date]];
//    NSString *date = [formatter stringFromDate:destDate];
//    
//    if ([now isEqualToString:date]) {
//        return YES;
//    }
//    
//    return NO;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *destCmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:destDate];
    
    if (nowCmps.year == destCmps.year && nowCmps.month == destCmps.month && nowCmps.day == destCmps.day ) {
        return YES;
    }
    
    return NO;
}

+(BOOL)isSameHour:(NSDate *)destDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *cmps = [calendar components:NSCalendarUnitHour fromDate:destDate toDate:[NSDate date] options:0];
    
    
    if (cmps.hour == 0) {
        return YES;
    }
    
    return NO;
  
}













@end
