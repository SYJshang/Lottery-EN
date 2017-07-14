//
//  Utils.m
//  TestApplication
//
//  Created by 潘鸿吉 on 13-4-22.
//  Copyright (c) 2013年 潘鸿吉. All rights reserved.
//

#import "Utils.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#import "AppDelegate.h"
#include <math.h>

@implementation Utils
+ (AppDelegate*)sharedDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

+ (void)showAlert:(NSString*)title msg:(NSString*)msg{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}


+ (CGRect)screenRect{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        rect.size = CGSizeMake(rect.size.height, rect.size.width);
    }
    
//    if (![UIApplication sharedApplication].statusBarHidden) {
//        rect.origin.y -= 20;
//    }
    return rect;
}

+ (float)nextHeight:(id)sender{
    return ((UIView*)sender).frame.origin.y + ((UIView*)sender).frame.size.height;
}

+ (NSString*)base64forData:(NSData*)theData {
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}


+ (BOOL)isEmptyString:(NSString*)testString{
    if (!testString) {
        return YES;
    }
    if ([[testString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
}

+ (NSString*)appIdentifier{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)bundlePath:(NSString *)fileName {
    return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
}

+ (NSString *)documentsPath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+ (NSString *)tempPath:(NSString *)fileName {
//    NSArray *paths = [[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"temp"];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+ (NSString *)getDeviceModel{
    struct utsname u;
    uname(&u);
    NSString *modelVersion = [NSString stringWithFormat:@"%s", u.machine];
    return modelVersion;
}

+ (NSString*)systemVersion{
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString*)platformString{
    // Gets a string with the device model
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"])return@"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])return@"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])return@"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])return@"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])return@"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])return@"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])return@"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])return@"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])return@"iPhone 5 (GSM+CDMA)";
    
    if ([platform isEqualToString:@"iPod1,1"])return@"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])return@"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])return@"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])return@"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])return@"iPod Touch (5 Gen)";
    
    if ([platform isEqualToString:@"iPad1,1"])return@"iPad";
    if ([platform isEqualToString:@"iPad1,2"])return@"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])return@"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])return@"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])return@"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])return@"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])return@"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])return@"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])return@"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])return@"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])return@"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])return@"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])return@"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])return@"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])return@"iPad 4 (GSM+CDMA)";

    if ([platform isEqualToString:@"i386"]) return@"Simulator";
    if ([platform isEqualToString:@"x86_64"]) return@"Simulator";

    return platform;
}

+ (BOOL) isIphone5
{
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size);
    }
    else
    {
        return NO;
    }
}

+ (BOOL) isIphone4
{
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size);
    }
    else
    {
        return NO;
    }
}

+(BOOL)isIphone6{
    
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        
        return CGSizeEqualToSize(CGSizeMake(750, 1334), [UIScreen mainScreen].currentMode.size);
    }
    
    return NO;
}

+(BOOL)isIphone6Plus{
    
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        
        return CGSizeEqualToSize(CGSizeMake(1242, 2208), [UIScreen mainScreen].currentMode.size);
    }
    
    return NO;
}


+ (float)tabbarBtnHeight
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]<7) {
        return 411;
    }else{
        return 431;
    }
}

+ (float)heightOfViewWithoutNavBarAndTabbar
{
    if ([self isIphone5]) {
        return 568-K_FRAME_HEAD_HEIGHT-K_FRAME_NAVIGATION_BAR_HEIGHT-K_FRAME_TABBAR_BACKGROUND_HEIGHT;
    }else{
        return 480-K_FRAME_HEAD_HEIGHT-K_FRAME_NAVIGATION_BAR_HEIGHT-K_FRAME_TABBAR_BACKGROUND_HEIGHT;

    }
}

+ (float)heightOfViewWithoutNavBar{
    if ([self isIphone5]) {
        return 568-K_FRAME_HEAD_HEIGHT-K_FRAME_NAVIGATION_BAR_HEIGHT;
    }else{
        return 480-K_FRAME_HEAD_HEIGHT-K_FRAME_NAVIGATION_BAR_HEIGHT;
        
    }

}

+ (NSString *) getTimeForNow
{
    NSDate * senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *timeDate = [[NSString alloc] initWithString:[dateformatter stringFromDate:senddate]];
    return timeDate;
}

+ (UIImage *)getImageFromProject:(NSString *)path
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:@"png"]];
}

+ (UIFont*) getTitleFontWithSize : (float) _size
{
    return [UIFont fontWithName:@"ShiShangZhongHeiJianTi" size:_size];
//    return [UIFont fontWithName:@"TRENDS" size:15.0f];
}

+(BOOL)validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

+(BOOL)validateTelPhone: (NSString *) TelPhoneStr{
    NSString *telPhoneRegex = @"\\b(1)[358][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
    NSPredicate *telPhonelTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telPhoneRegex];
    
    return [telPhonelTest evaluateWithObject:TelPhoneStr];
}

+ (void) hudShow
{
   // [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudShow];
}

+ (void) hudShow : (NSString*) msg
{
   // [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudShow:msg];
}

+ (void) hudShowHidden : (NSString*) msg
{
   // [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudShowHidden:msg];
}
+ (void) hudSuccessHidden
{
   // [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudSuccessHidden];
}

+ (void) hudSuccessHidden : (NSString*) msg
{
  //  [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudSuccessHidden:msg];
}

+ (void) hudFailHidden
{
   // [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudFailHidden];
}

+ (void) hudFailHidden : (NSString*) msg{
   // [(AppDelegate*)[[UIApplication sharedApplication] delegate] hudFailHidden:msg];
}

+ (NSString*) getEncodingWithGBK : (NSString*) _str{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [_str stringByAddingPercentEscapesUsingEncoding:enc];
}

//#pragma mark - 生成参数串
//+ (NSString *)urlStringAddress:(NSString *)type {
//    NSString *urlStr = [NSString stringWithFormat:@"devicetype=iphone&deviceid=%@",[Utils getDeviceId]];
//    if ([type isEqualToString:@"token"]) {
//        urlStr = [NSString stringWithFormat:@"%@&token=%@",urlStr,[GlobalsConfig shareInstance].myToken];
//    }
//    if ([GlobalsConfig shareInstance].myCllocation) {
//        urlStr = [NSString stringWithFormat:@"%@&lat=%f&lng=%f",urlStr,[GlobalsConfig shareInstance].myCllocation.coordinate.latitude,[GlobalsConfig shareInstance].myCllocation.coordinate.longitude];
//    }
//    if ([GlobalsConfig shareInstance].myCity) {
//        NSString *urlString = [GlobalsConfig shareInstance].myCity;
//        NSString * encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        urlStr = [NSString stringWithFormat:@"%@&citycode=%@&cityname=%@",urlStr,[GlobalsConfig shareInstance].myEntity.CityCode,encodedString];//[GlobalsConfig shareInstance].myCity
//    }
//    urlStr = [NSString stringWithFormat:@"%@&_k=%lld",urlStr,[Utils getData]];
//    
//    return urlStr;
//}

#pragma mark -
#pragma mark 格式校验

//验证邮箱格式是否正确
+ (BOOL)isEmailAddress:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isEmailAddressValid = [emailTest evaluateWithObject:email];
    
    return isEmailAddressValid;
    
}

#pragma mark - 颜色转换

+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    
    return result;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


#pragma mark - 彩色图片转化成黑白图片
+ (UIImage*)changeImageToGrayScale:(UIImage*)anImage type:(int)type {
    
    CGImageRef imageRef = anImage.CGImage;
    
    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    size_t bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
    
    size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
    
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    
    
    bool shouldInterpolate = CGImageGetShouldInterpolate(imageRef);
    
    CGColorRenderingIntent intent = CGImageGetRenderingIntent(imageRef);
    
    CGDataProviderRef dataProvider = CGImageGetDataProvider(imageRef);
    
    CFDataRef data = CGDataProviderCopyData(dataProvider);
    
    UInt8 *buffer = (UInt8*)CFDataGetBytePtr(data);
    
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8 *tmp;
            tmp = buffer + y * bytesPerRow + x * 4;
            
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            UInt8 brightness;
            switch (type) {
                case 1:
                    brightness = (77 * red + 28 * green + 151 * blue) / 256;
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = brightness;
                    break;
                case 2:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green * 0.7;
                    *(tmp + 2) = blue * 0.4;
                    break;
                case 3:
                    *(tmp + 0) = 255 - red;
                    *(tmp + 1) = 255 - green;
                    *(tmp + 2) = 255 - blue;
                    break;
                default:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green;
                    *(tmp + 2) = blue;
                    break;
            }
        }
    }
    
    
    CFDataRef effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(data));
    
    CGDataProviderRef effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef effectedCgImage = CGImageCreate(
                                               width, height,
                                               bitsPerComponent, bitsPerPixel, bytesPerRow,
                                               colorSpace, bitmapInfo, effectedDataProvider,
                                               NULL, shouldInterpolate, intent);
    
    UIImage *effectedImage = [[UIImage alloc] initWithCGImage:effectedCgImage];
    
    CGImageRelease(effectedCgImage);
    
    CFRelease(effectedDataProvider);
    
    CFRelease(effectedData);
    
    CFRelease(data);
    
    return effectedImage;
    
}

+ (BOOL)isContainString:(NSString *)first ContaionStr:(NSString *)second
{
    NSRange range = [first rangeOfString:second];
    if(range.location!=NSNotFound) {
        return true;
    } else {
        return false;
    }
}


#pragma mark - 时间转换（某时间距离1970年的秒数）

+(int)longTimeDateChangeToString:(double)dateTimeeeee{
    
    NSDate *dateTime = [NSDate dateWithTimeIntervalSince1970:dateTimeeeee];
    NSString *timeStr = [NSString stringWithFormat:@"%@",dateTime];
    
    NSString*dayStr;
    if (timeStr.length>10) {
        
        NSRange ranggg = {8,2};
        
        dayStr = [timeStr substringWithRange:ranggg];
    }
    NSLog(@"timeStr:%@",timeStr);
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
//
//    NSDate *destDate= [dateFormatter dateFromString:timeStr];
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
//    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:destDate];
//    
//    
    int dayDate = [dayStr intValue];

    return dayDate;
}

+(int)longTimeDateChangeToStr:(double)dateTimeeeee{
    NSDate *dateTime = [NSDate dateWithTimeIntervalSince1970:dateTimeeeee];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [formatter stringFromDate:dateTime];
    
    if (str.length>10) {
        
        NSRange ranggg = {8,2};
        
        str = [str substringWithRange:ranggg];
    }
    NSLog(@"timeStr:%@",str);
    int dayDate = [str intValue];
    
    return dayDate;
}

+(NSString *)longTimeToStr:(double)dateTimeeeee {
    NSDate *dateTime = [NSDate dateWithTimeIntervalSince1970:dateTimeeeee];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [formatter stringFromDate:dateTime];
    return str;
}

+(NSString*)getIntervalDateFromCurrentTime:(double)timedate
{
    NSDate *dateTime = [NSDate dateWithTimeIntervalSince1970:timedate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [formatter dateFromString:[formatter stringFromDate:dateTime]];
    NSDate *date2 = [NSDate date];
    NSTimeInterval aTimer = [date2 timeIntervalSinceDate:date1];
    
    int hour = (int)(aTimer/3600);
    int minute = (int)(aTimer - hour*3600)/60;
    
    int day = (int)(hour/24);
    //    int second = aTimer - hour*3600 - minute*60;
    NSString *dural;
    
    
    if (day>0) {
        dural = [NSString stringWithFormat:@"%d天前",day];
    } else {
        if (hour>0) {
            dural = [NSString stringWithFormat:@"%d小时前",hour];
        } else {
            if (minute >0) {
                dural = [NSString stringWithFormat:@"%d分钟前",minute];
            } else {
                dural = [NSString stringWithFormat:@"刚刚"];
            }
        }
    }
    
    
    return dural;
}

+(long long int)getData {
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time;
    
    return date;
}

#pragma mark -
#pragma mark json解析

+ (NSString *)paramStringIsNull:(NSString *)param
{
    return ([param isEqual:[NSNull null]] || param == nil ) ? @"" : param;
}

+ (NSString *)paramStringIsNull:(NSString *)param format:(NSString *)format {
    return ([param isEqual:[NSNull null]] || param == nil || [param isEqualToString:@""]) ? format : param;
}

+ (NSNumber *)paramNumberIsNull:(NSNumber *)param
{
    if ([param isKindOfClass:[NSNumber class]]) {
        
        return ([param isEqual:[NSNull null]] || param == nil || [param isEqual: @""]) ? @0 : param;
    }else if ([param isKindOfClass:[NSString class]]) {
        NSString *num = (NSString *)param;
        
        return param;
        return [[Utils paramStringIsNull:num] isEqualToString:@""] ? @0  : [NSNumber numberWithFloat:[num doubleValue]];
    }
    
    return @0;
}

+ (NSNumber *)paramNumberDoubleIsNull:(NSNumber *)param
{
    if ([param isKindOfClass:[NSNumber class]]) {
        
        return ([param isEqual:[NSNull null]] || param == nil || [param isEqual: @""]) ? @0 : param;
    }else if ([param isKindOfClass:[NSString class]]) {
        NSString *num = (NSString *)param;
        return [[Utils paramStringIsNull:num] isEqualToString:@""] ? @0  : [NSNumber numberWithDouble:[num doubleValue]];
    }
    return @0;
    return ([param isEqual:[NSNull null]] || param == nil || [param isEqual: @""]) ? @0 : param;
}


+(NSDictionary *)getURLReqContentDict:(NSString *)url
{
    NSArray *array = [url componentsSeparatedByString:@"?"];
    
    if (array.count > 1) {
        NSString *com = [array objectAtIndex:1];
        NSArray *arr = [com componentsSeparatedByString:@"&"];
        
        for (int i = 0; i < arr.count; ++i) {
            NSArray *itemArray = [[arr objectAtIndex:i] componentsSeparatedByString:@"="];
            
            if (itemArray.count > 1) {
                if ([itemArray[0] isEqualToString:@"ReqContent"]) {
                    
                    NSData *data = [itemArray[1] dataUsingEncoding:NSUTF8StringEncoding];
                    
                    
                    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                }
            }
        }
    }
    
    return nil;
}


+ (NSArray *)getURLParams:(NSString *)url
{
    NSArray *array = [url componentsSeparatedByString:@"?"];
    
    if (array.count > 1) {
        NSString *com = [array objectAtIndex:1];
        NSArray *arr = [com componentsSeparatedByString:@"&"];
        
        NSMutableArray *resultArray = [NSMutableArray array];
        
        for (int i = 0; i < arr.count; ++i) {
            NSArray *itemArray = [[arr objectAtIndex:i] componentsSeparatedByString:@"="];
            
            if (itemArray && ![itemArray isEqual:[NSNull null]]) {
                
                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                if (itemArray.count == 1) {
                    [dict setValue:[Utils paramStringIsNull:[itemArray objectAtIndex:0]] forKey:@"key"];
                    [dict setValue:@"" forKey:@"value"];
                    
                    [resultArray addObject:dict];
                }else if (itemArray.count == 2){
                    [dict setValue:[Utils paramStringIsNull:[itemArray objectAtIndex:0]] forKey:@"key"];
                    [dict setValue:[Utils paramStringIsNull:[itemArray objectAtIndex:1]] forKey:@"value"];
                    
                    [resultArray addObject:dict];
                }
                
                
            }
            
        }
        
        return resultArray;
    }
    
    return nil;
}
#pragma mark 当前月份多少天
+ (int)getDaysOfCurrentMonth{
    //获取当前时间
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    int month = [dateComponent month];

    
    switch (month) {
        case 1:
            return 31;
            break;
            
        case 2:
        {
            if ([self isLeapMonth]) {
                return 28;
            }else{
                return 29;
            }
        }
            break;
        case 3:
            return 31;
            break;
        case 4:
            return 30;
            break;
        case 5:
            return 31;
            break;
        case 6:
            return 30;
            break;
        case 7:
            return 31;
            break;
        case 8:
            return 31;
            break;
        case 9:
            return 30;
            break;
        case 10:
            return 31;
            break;
        case 11:
            return 30;
            break;
        case 12:
            return 31;
            break;
        default:
            break;
    }
    return 0;
    
}

//判断今天是几号
+(BOOL)isCurrentDayToday:(int)date{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    

    int day = [dateComponent day];
    if (date==day) {
        return YES;
    }else{
        return NO;
    }
}

//是否是润月
+ (BOOL)isLeapMonth{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    int year = [dateComponent year];
//    int month = [dateComponent month];
//    int day = [dateComponent day];
//    int hour = [dateComponent hour];
//    int minute = [dateComponent minute];
//    int second = [dateComponent second];
    
    NSLog(@"year is: %d", year);
    
    if (year%4==0) {
        return YES;
    }else{
        return NO;
    }
}

//本月是几月
+ (int)getMonthNum{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    int month = [dateComponent month];
    return month;
}

#pragma mark -
#pragma mark 获取中文字符串转码utf8
+ (NSString*) getEncodingWithUTF8:(NSString *)_str{
    return [_str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark 判断设备
+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
//    iphone5s 及以下　传640 　iphone6传  750 　iphone6 plus传 828

    if (K_FRAME_BASE_WIDTH<=320) {
        return @"640";
    }else if (375==K_FRAME_BASE_WIDTH || (375<K_FRAME_BASE_WIDTH && K_FRAME_BASE_WIDTH<414) ){
        return @"750";
    }else if (K_FRAME_BASE_WIDTH>=414){
        return @"828";
    }else{
        return @"";
    }
    
}
+ (BOOL) getStatusByIndex:(int) inputNum index:(int) index
{
    int num=powf(2.0, (float)index);
        
    return inputNum&num;
}

#pragma mark -保存NSUserDefaults的用户信息

//+(void)saveUserInfoToUserDefaultsWithMemberEntity:(UserEntity *)meEntity{
//    
//    [[GlobalsConfig shareInstance] setUserEntity:meEntity];
//
//    
//}
//
@end
