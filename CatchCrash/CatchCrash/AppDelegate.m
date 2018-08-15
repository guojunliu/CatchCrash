//
//  AppDelegate.m
//  CatchCrash
//
//  Created by steve on 2018/7/9.
//  Copyright © 2018年 liuguojun. All rights reserved.
//

#import "AppDelegate.h"
#import "CatchCrash.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"沙盒path:%@", path);
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler1);
    
    g_vaildUncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
    
    //注册消息处理函数的处理方法
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    return YES;
}

@end
