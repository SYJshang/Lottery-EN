
# ifndef __COMPILER_DCBD6572E80C4FBAAF9E371EDEB135B5_H_INCLUDED
# define __COMPILER_DCBD6572E80C4FBAAF9E371EDEB135B5_H_INCLUDED

# ifdef __cplusplus
#   define CXX_MODE

#   include <iostream>

#   define C_BEGIN \
extern "C" {
#   define C_END \
}

# else

#   define C_BEGIN
#   define C_END

# endif

# if defined(__OBJC__) || defined(__OBJC2__)
#   define OBJC_MODE
# import <UIKit/UIKit.h>

#   import <Foundation/Foundation.h>

#   include <TargetConditionals.h>

# if __has_feature(objc_arc) == 1
#   define OBJC_ARC 1
# endif

# ifdef OBJC_ARC
#   define OBJC_NEED_ARC
# endif

# endif

# if TARGET_OS_IPHONE
#   define IOS_DEVICE
#   if TARGET_IPHONE_SIMULATOR
#     define IOS_SIMULATOR
#   endif
# else
#   define MAC_DEVICE
# endif

# define COMMA ,

# define C_MODE

# if defined(_DEBUG) || defined(_DEBUG_) || defined(DEBUG)
#   define PRECOMP_DEBUG_MODE
# endif

# ifdef PRECOMP_DEBUG_MODE
#   define DEBUG_MODE
#   define DEBUG_EXPRESS(exp) exp
#   define RELEASE_EXPRESS(exp) {}
#   define DEBUG_SYMBOL(sym) sym
#   define RELEASE_SYMBOL(sym)
#   define TEST_EXPRESS(exp) exp
# else
#   define RELEASE_MODE
#   define DEBUG_EXPRESS(exp) {}
#   define RELEASE_EXPRESS(exp) exp
#   define DEBUG_SYMBOL(sym)
#   define RELEASE_SYMBOL(sym) sym
# endif

# define _PRAGMA(X) _Pragma (#X)
# define CC_WARNING_PUSH _PRAGMA(GCC diagnostic push)
# define CC_WARNING_POP _PRAGMA(GCC diagnostic pop)
# define CC_WARNING_DISABLE(warn) _PRAGMA(GCC diagnostic ignored #warn)

# if defined(DISTRIBUTION)
#   define DISTRIBUTION_MODE
# else
#   define DEVELOP_MODE
# endif

# define _LOG_SYNCHRONIZED_BEGIN \
@synchronized(self) { \
LOG("sync object:%x %s:%s:%d enter", self, __FILE__, __FUNCTION__, __LINE__); \

# define _LOG_SYNCHRONIZED_END \
LOG("sync object:%x %s:%s:%d leave", self, __FILE__, __FUNCTION__, __LINE__); \
}

# define _SYNCHRONIZED_BEGIN \
@synchronized(self) {

# define _SYNCHRONIZED_END \
}

# define SYNCHRONIZED_BEGIN _SYNCHRONIZED_BEGIN
# define SYNCHRONIZED_END _SYNCHRONIZED_END

# ifdef CXX_MODE

#   define NS_BEGIN(ns) namespace ns {
#   define NS_END }

#   define C_BEGIN extern "C" {
#   define C_END }

#   define NS_USING(ns) using namespace ns;

# else

#   define C_BEGIN
#   define C_END

# endif

# ifdef __IPHONE_7_0
#   define IOS_SDK_7 1
# endif

# define EXTERN extern 

# define IOS7_FEATURES

# if !defined(IOS_SDK_7) && defined(IOS7_FEATURES)
#   undef IOS7_FEATURES
# endif

C_BEGIN

extern void __debug_vlog(char const*, va_list);
extern void __debug_vinfo(char const*, va_list);
extern void __debug_vnoti(char const*, va_list);
extern void __debug_vfatal(char const*, va_list);
extern void __debug_vwarn(char const*, va_list);

extern void __debug_log(char const*, ...);
extern void __debug_info(char const*, ...);
extern void __debug_noti(char const*, ...);
extern void __debug_fatal(char const*, ...);
extern void __debug_warn(char const*, ...);

extern void __release_log(char const*, ...);

static const bool kDebugMode = DEBUG_SYMBOL(true) RELEASE_SYMBOL(false);
static const bool kReleaseMode = DEBUG_SYMBOL(false) RELEASE_SYMBOL(true);

C_END

# define LOG DEBUG_SYMBOL(__debug_log) RELEASE_SYMBOL(__release_log)
# define INFO DEBUG_SYMBOL(__debug_info) RELEASE_SYMBOL(__release_log)
# define NOTI DEBUG_SYMBOL(__debug_noti) RELEASE_SYMBOL(__release_log)
# define FATAL DEBUG_SYMBOL(__debug_fatal) RELEASE_SYMBOL(__release_log)
# define WARN DEBUG_SYMBOL(__debug_warn) RELEASE_SYMBOL(__release_log)

# define TODO(msg) NOTI("计划实现 %s, %s:%s:%d", msg, __FILE__, __FUNCTION__, __LINE__);
# define NEEDIMPL TODO("(必须)");

# define THROW(msg) DEBUG_EXPRESS(@throw [NSException exceptionWithName:@"fatal" reason:msg userInfo:nil]);

# define ASSERT_ALWAYS(exp, msg) \
{if ((exp) == NO) { \
NSString* str = [NSString stringWithFormat:@"Assert: Failed check [%s] \n line:%d \n function:%s \n file:%s \n message:%@", #exp, __LINE__, __FUNCTION__, __FILE__, msg]; \
THROW(str); \
}}

# define ASSERTMSG(exp, msg) DEBUG_EXPRESS(ASSERT_ALWAYS(exp, msg))
# define ASSERT(exp) ASSERTMSG(exp, @"")

# define TRIEXPRESS(cond, expt, expf) ((cond) ? (expt) : (expf))
# define VALUEXCP(v0, v1) TRIEXPRESS(v0, v0, v1)
# define VALUEAPP(v0, exp) TRIEXPRESS(v0, (v0 exp), v0)

extern BOOL kDeviceRunningSimulator;

# define SIMULATOR_EXPRESS(exp) \
{if (kDeviceRunningSimulator) {exp;}}

# define SIMULATOR_DEXPRESS(exp) \
DEBUG_EXPRESS(SIMULATOR_EXPRESS(exp))

# define SIMULATOR_VALUE(v0, v1) \
(kDeviceRunningSimulator ? (v0) : (v1))

@interface NSError (dbg)

// 打印日志
- (void)log;

@end

@interface NSException (dbg)

// 打印日志
- (void)log;

// 附带提示信息的打印日志
- (void)log:(NSString*)str;

@end

// 类似于 i++ 的后操作
# define ATOMIC_INC(x, v) __sync_fetch_and_add(&x, v)
# define ATOMIC_DEC(x, v) __sync_fetch_and_sub(&x, v)

// 类似于 ++i 的前操作
# define ATOMIC_ADD(x, v) __sync_add_and_fetch(&x, v)
# define ATOMIC_SUB(x, v) __sync_sub_and_fetch(&x, v)

# define MIN_SUB(x, v, min) (((x) - (v) < (min)) ? (min) : (x) - (v))
# define MAX_ADD(x, v, max) (((x) + (v) > (max)) ? (max) : (x) + (v))

# define NEED // 必要参数
# define IN // 输入参数
# define OUT // 输入参数
# define INOUT // 输入、输出参数
# define OPTIONAL // 可选参数（可以不传）
# define OPTMUST // 可选但是必须传一个的参数

# undef	AS_STATIC_PROPERTY
# define AS_STATIC_PROPERTY( __name ) \
- (NSString *)__name; \
+ (NSString *)__name;

# if __has_feature(objc_arc)

# undef	DEF_STATIC_PROPERTY
# define DEF_STATIC_PROPERTY( __name ) \
- (NSString *)__name \
{ \
  return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%s", #__name]; \
}

# else


# undef	DEF_STATIC_PROPERTY
# define DEF_STATIC_PROPERTY( __name ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%s", #__name]; \
}

# endif

# if __has_feature(objc_arc)

# undef	DEF_STATIC_PROPERTY2
# define DEF_STATIC_PROPERTY2( __name, __prefix ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%s", __prefix, #__name]; \
}

# else

# undef	DEF_STATIC_PROPERTY2
# define DEF_STATIC_PROPERTY2( __name, __prefix ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%s", __prefix, #__name]; \
}

# endif

# if __has_feature(objc_arc)

# undef	DEF_STATIC_PROPERTY3
# define DEF_STATIC_PROPERTY3( __name, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__name]; \
}

#else

# undef	DEF_STATIC_PROPERTY3
# define DEF_STATIC_PROPERTY3( __name, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__name]; \
}

# endif

# if __has_feature(objc_arc)

# undef	DEF_STATIC_PROPERTY4
# define DEF_STATIC_PROPERTY4( __name, __value, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__value]; \
}

# else

# undef	DEF_STATIC_PROPERTY4
# define DEF_STATIC_PROPERTY4( __name, __value, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__value]; \
}

# endif

//???
# pragma mark -

# undef	AS_STATIC_PROPERTY_INT
# define AS_STATIC_PROPERTY_INT( __name ) \
- (NSInteger)__name; \
+ (NSInteger)__name;

# undef	DEF_STATIC_PROPERTY_INT
# define DEF_STATIC_PROPERTY_INT( __name, __value ) \
- (NSInteger)__name \
{ \
return (NSInteger)[[self class] __name]; \
} \
+ (NSInteger)__name \
{ \
return __value; \
}

# undef	AS_INT
# define AS_INT	AS_STATIC_PROPERTY_INT

# undef	DEF_INT
# define DEF_INT	DEF_STATIC_PROPERTY_INT

# pragma mark -

# undef	AS_STATIC_PROPERTY_NUMBER
# define AS_STATIC_PROPERTY_NUMBER( __name ) \
- (NSNumber *)__name; \
+ (NSNumber *)__name;

# undef	DEF_STATIC_PROPERTY_NUMBER
# define DEF_STATIC_PROPERTY_NUMBER( __name, __value ) \
- (NSNumber *)__name \
{ \
return (NSNumber *)[[self class] __name]; \
} \
+ (NSNumber *)__name \
{ \
return [NSNumber numberWithInt:__value]; \
}

# undef	AS_NUMBER
# define AS_NUMBER	AS_STATIC_PROPERTY_NUMBER

# undef	DEF_NUMBER
# define DEF_NUMBER	DEF_STATIC_PROPERTY_NUMBER

# pragma mark -

# undef	AS_STATIC_PROPERTY_STRING
# define AS_STATIC_PROPERTY_STRING( __name ) \
- (NSString *)__name; \
+ (NSString *)__name;

# undef	DEF_STATIC_PROPERTY_STRING
# define DEF_STATIC_PROPERTY_STRING( __name, __value ) \
- (NSString *)__name \
{ \
return [[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return __value; \
}

# undef	AS_STRING
# define AS_STRING	AS_STATIC_PROPERTY_STRING

# undef	DEF_STRING
# define DEF_STRING	DEF_STATIC_PROPERTY_STRING


# endif
