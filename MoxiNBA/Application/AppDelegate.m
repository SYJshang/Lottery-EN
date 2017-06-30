//
//  AppDelegate.m
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "AppDelegate.h"
//#import "SYJMainViewController.h"
#import "SYJNavitionController.h"
#import "SYJTabBarController.h"
#import <UMMobClick/MobClick.h>
#import <JPUSHService.h>
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#import <MMDrawerController.h>
#import "SYJLeftController.h"
#import "LoginViewController.h"

#endif
@interface AppDelegate ()<JPUSHRegisterDelegate>

@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, strong) SYJTabBarController *tabBar;

@end

@implementation AppDelegate

- (void)switchIndexPage: (NSInteger)index {
    
    SYJTabBarController *tab = [[SYJTabBarController alloc]init];
    tab.selectedIndex = index;
    self.window.rootViewController = self.drawerController;
    
}

- (void)switchToRootVc{
    
    LoginViewController *vc = [[LoginViewController alloc]init];
    SYJNavitionController *nav = [[SYJNavitionController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    SYJLeftController *leftVC = [[SYJLeftController alloc]init];
    SYJTabBarController *vc = [[SYJTabBarController alloc]init];
  
//   SYJNavitionController *centerNvaVC = [[SYJNavitionController alloc]initWithRootViewController:vc];
    SYJNavitionController *leftNvaVC = [[SYJNavitionController alloc]initWithRootViewController:leftVC];

    //3、使用MMDrawerController
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:vc leftDrawerViewController:leftNvaVC rightDrawerViewController:nil];

    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    //5、设置左右两边抽屉显示的多少
    self.drawerController.maximumLeftDrawerWidth = 200.0;
    self.drawerController.maximumRightDrawerWidth = 200.0;
    
//    SYJNavitionController *nav = [[SYJNavitionController alloc]initWithRootViewController:vc];

//    self.window.rootViewController = self.drawerController;
    
    if ([[gobalConfig getInstance] IsLogin] == YES) {
        self.window.rootViewController = self.drawerController;
    }else{
        LoginViewController *login = [[LoginViewController alloc]init];
        SYJNavitionController *nav = [[SYJNavitionController alloc]initWithRootViewController:login];
        self.window.rootViewController = nav;
    }

    
    [self.window makeKeyAndVisible];
    
    //友盟注册
    UMConfigInstance.appKey = @"59434f9c1061d257da000d3b";
    UMConfigInstance.channelId = @"App Store";
    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    
    //极光
    //Required
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |UIUserNotificationTypeSound |UIUserNotificationTypeAlert)categories:nil];
        
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    // Optional
    // 获取IDFA
    // 如需使用IDFA功能请添加此代码并在初始化方法的advertisingIdentifier参数中填写对应值
    //    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:@"8dff00d494edcf03a60774f1"
                          channel:@"App Store"
                 apsForProduction:0
            advertisingIdentifier:nil];

    
    // Override point for customization after application launch.
    return YES;
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}


#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
