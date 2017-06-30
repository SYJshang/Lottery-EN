//
//  Utils.h
//  TestApplication
//
//  Created by jack.wang on 13-4-22.
//  Copyright (c) 2013年 jack.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>
#import "UIImageView+imageNamed.h"
#import "UIView+correctImage.h"
#import "UIButton+buttonImageNamed.h"
#import "UIView+bottomPosition.h"
#import "UITextField+fontSizeUp.h"
#import "UILabel+fontSizeUp.h"
//#import "UserEntity.h"
#import "AppDelegate.h"
@interface Utils : NSObject {
    
}

+ (AppDelegate*)sharedDelegate;

+ (CGRect)screenRect;

+ (float)nextHeight:(id)sender;

+ (NSString*)base64forData:(NSData*)theData;

+ (BOOL)isContainString:(NSString *)first ContaionStr:(NSString *)second;

+ (BOOL)isEmptyString:(NSString*)testString;

//app bundle id
+ (NSString*)appIdentifier;
//bundle目录
+ (NSString *)bundlePath:(NSString *)fileName;
//document目录
+ (NSString *)documentsPath:(NSString *)fileName;
//临时目录
+ (NSString *)tempPath:(NSString *)fileName;
//系统版本
+ (NSString*)systemVersion;
//平台类型
+ (NSString*)platformString;

+ (NSString*)getDeviceModel;

+ (BOOL) isIphone4;

+ (BOOL)isIphone5;

+(BOOL)isIphone6;

+(BOOL)isIphone6Plus;

+ (float)tabbarBtnHeight;

+ (float)heightOfViewWithoutNavBarAndTabbar;

+ (float)heightOfViewWithoutNavBar;

+ (NSString*)getTimeForNow;

+ (UIImage*)getImageFromProject:(NSString*)path;

+ (UIFont*)getTitleFontWithSize:(float) _size;

//+(void)drawAlertBackGroundImage:(UIAlertView *)alert backGroundImageName:(NSString*) imageName;
//判断string是否是邮箱
+(BOOL)validateEmail:(NSString*)candidate;
//判断string是否是手机
+(BOOL)validateTelPhone:(NSString*)TelPhoneStr;

+ (void) hudShow;
+ (void) hudShow : (NSString*) msg;
+ (void) hudShowHidden : (NSString*) msg;
+ (void) hudSuccessHidden;

+ (void) hudSuccessHidden : (NSString*) msg;

+ (void) hudFailHidden;
+ (void) hudFailHidden : (NSString*) msg;

+ (NSString*) getEncodingWithGBK : (NSString*) _str;

#pragma mark - 生成参数串
+ (NSString *)urlStringAddress:(NSString *)type;
#pragma mark 校验
//验证邮箱格式是否正确
+ (BOOL)isEmailAddress:(NSString *)email;

#pragma mark - 颜色
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

#pragma mark - JSON转Dictionary
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//彩色图片转化成黑白图片
+ (UIImage*)changeImageToGrayScale:(UIImage*)anImage type:(int)type;

//时间转换（某时间距离1970年的秒数）
+(NSString*)getIntervalDateFromCurrentTime:(double)timedate;
+(int)longTimeDateChangeToString:(double)dateTimeeeee;
+(int)longTimeDateChangeToStr:(double)dateTimeeeee;
+(NSString *)longTimeToStr:(double)dateTimeeeee;
+(long long int)getData;
#pragma mark -
#pragma mark json 解析
+ (NSString *)paramStringIsNull:(NSString *)param;

+ (NSString *)paramStringIsNull:(NSString *)param format:(NSString *)format;

+ (NSNumber *)paramNumberIsNull:(NSNumber *)param;

+ (NSNumber *)paramNumberDoubleIsNull:(NSNumber *)param;

+ (NSArray *)getURLParams:(NSString *)url;

#pragma mark 当前月份多少天
+ (int)getDaysOfCurrentMonth;
//判断今天是几号
+(BOOL)isCurrentDayToday:(int)date;
//本月是几月
+ (int)getMonthNum;
//是否是润月
+ (BOOL)isLeapMonth;

#pragma mark 获取中文字符串转码utf8
+ (NSString*) getEncodingWithUTF8:(NSString *)_str;

// 读取保存的udid
+(NSString *)getDeviceId;

// 删除udid
+(void)removeUdid;

#pragma mark 判断设备
+ (NSString*)deviceString;
#pragma mark 取得道具可用状态
+ (BOOL) getStatusByIndex:(int) inputNum index:(int) index;
#pragma mark -保存NSUserDefaults的用户信息
//+(void)saveUserInfoToUserDefaultsWithMemberEntity:(UserEntity*)meEntity;

@end
