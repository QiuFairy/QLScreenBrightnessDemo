//
//  AppDelegate.m
//  QLScreenBrightnessDemo
//
//  Created by qiu on 2017/4/17.
//  Copyright © 2017年 QiuFairy. All rights reserved.
//

#import "AppDelegate.h"

//再次激活时，设置为调整后的亮度
NSString *const SetScreenBrightnessNotification = @"Notification_SetBrightness";
//进入后台，杀掉进程后设置为默认亮度
NSString *const DefaultScreenBrightnessNotification = @"Notification_DefaultBrightness";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application{
    [[NSNotificationCenter defaultCenter] postNotificationName:DefaultScreenBrightnessNotification object:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
     [[NSNotificationCenter defaultCenter] postNotificationName:SetScreenBrightnessNotification object:nil];
}

 - (void)applicationWillTerminate:(UIApplication *)application{
    [[NSNotificationCenter defaultCenter] postNotificationName:DefaultScreenBrightnessNotification object:nil];  
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}



@end
