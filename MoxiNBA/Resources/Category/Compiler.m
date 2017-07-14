
# import "Compiler.h"
# include <pthread.h>
# include <stdarg.h>


# define CONSOLE_COLOR_BEGIN printf("\033[");
# define CONSOLE_COLOR_END printf("\033[;");

# define CONSOLE_COLOR_TEXT(r, g, b) printf("fg%d,%d,%d;", r, g, b);
# define CONSOLE_COLOR_BACK(r, g, b) printf("bg%d,%d,%d;", r, g, b);

# define CONSOLE_RGB_TEXT(val) CONSOLE_COLOR_TEXT(1, 1,1)
# define CONSOLE_RGB_BACK(val) CONSOLE_COLOR_BACK(1, 1, 1)

# define LOG_IMPL(type, name) \
void __##type##_##name(char const* msg, ...) {    \
va_list va; \
va_start(va, msg); \
__##type##_v##name(msg, va); \
va_end(va); \
}

LOG_IMPL(debug, log);
LOG_IMPL(debug, info);
LOG_IMPL(debug, noti);
LOG_IMPL(debug, fatal);
LOG_IMPL(debug, warn);

static pthread_mutex_t __gs_mtx_debug_log = PTHREAD_MUTEX_INITIALIZER;

static void* __log_last = NULL;
static float __log_color_bleach = 0;

# define LOG_COLOR_FIX \
if (__log_last == &__FUNCTION__) { __log_color_bleach = TRIEXPRESS(__log_color_bleach, 0, 0.5f); } \
else { __log_last = (void*)&__FUNCTION__; __log_color_bleach = 0; }

# define LOG_BEGIN(type) \
pthread_mutex_lock(&__gs_mtx_debug_log); \
if (msg == NULL) \
msg = "<none>"; \
printf(#type " %x: ", (int)pthread_self()); \
LOG_COLOR_FIX;

# define LOG_END \
printf(".\n"); \
fflush(stdout); \
pthread_mutex_unlock(&__gs_mtx_debug_log);

void __debug_vlog(char const* msg, va_list va) {
    LOG_BEGIN(LOGd);
    
    vprintf(msg, va);
    
    if (strcmp(msg, "<none>") == 0) {
        sleep(2);
    }
    
    LOG_END;
}

void __debug_vinfo(char const* msg, va_list va) {
    LOG_BEGIN(INFOd);
    
    CONSOLE_COLOR_BEGIN
    CONSOLE_RGB_TEXT(RGB_VALUE(0, 150, 0));
    vprintf(msg, va);
    CONSOLE_COLOR_END
    
    LOG_END;
}

void __debug_vnoti(char const* msg, va_list va) {
    LOG_BEGIN(INFOd);
    
    CONSOLE_COLOR_BEGIN
    CONSOLE_RGB_TEXT(RGB_VALUE(0, 0, 255));
    vprintf(msg, va);
    CONSOLE_COLOR_END
    
    LOG_END;
        
    // sleep 一会以提高注意度
    sleep(1);
}

void __debug_vfatal(char const* msg, va_list va) {
    LOG_BEGIN(FATALd);
    
    CONSOLE_COLOR_BEGIN
    CONSOLE_COLOR_TEXT(255, 0, 0);
    vprintf(msg, va);
    CONSOLE_COLOR_END
    
    LOG_END;
    
    // sleep 一会以提高注意度
    sleep(5);
}

void __debug_vwarn(char const* msg, va_list va) {
    LOG_BEGIN(WARNd);
    
    CONSOLE_COLOR_BEGIN
    CONSOLE_COLOR_TEXT(180, 0, 0);
    vprintf(msg, va);
    CONSOLE_COLOR_END
    
    LOG_END;
    
    // sleep 一会以提高注意度
    sleep(3);
}

void __release_log(char const* msg, ...) {
    // 不实现
}

extern void UIHudShowText(NSString*);

@implementation NSError (dbg)

- (void)log {
# ifdef DEBUG_MODE
    NSString* msg = [NSString stringWithFormat:@"NSError description:%@,\nreason:%@,\nsuggestion:%@",
                     self.localizedDescription,
                     self.localizedFailureReason,
                     self.localizedRecoverySuggestion];
    INFO(msg.UTF8String);
# endif
}

@end

@implementation NSException (dbg)

- (void)log {
# ifdef DEBUG_MODE
    NSString* msg = [NSString stringWithFormat:@"NSException: %@\nreason: %@",
                     self.description,
                     self.reason];
    FATAL(msg.UTF8String);
    //UIHudShowText(msg);
# endif
}

- (void)log:(NSString *)str {
# ifdef DEBUG_MODE
    NSString* msg = [NSString stringWithFormat:@"NSException: %@\ndescription: %@\nreason: %@",
                     str,
                     self.description,
                     self.reason];
    FATAL(msg.UTF8String);
    //UIHudShowText(msg);
# endif
}

@end
