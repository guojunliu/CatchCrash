//
//  CatchCrash.m
//  CatchCrash
//
//  Created by steve on 2018/7/9.
//  Copyright © 2018年 liuguojun. All rights reserved.
//

#import "CatchCrash.h"

@implementation CatchCrash

void uncaughtExceptionHandler(NSException *exception)
{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    NSLog(@"%@", exceptionInfo);
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:stackArray];
    [tmpArr insertObject:reason atIndex:0];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //保存到本地  --  当然你可以在下次启动的时候，上传这个log
    [exceptionInfo writeToFile:[NSString stringWithFormat:@"%@/error.log",path] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //这里会崩溃，不知道为啥，后续还需要在研究一下
    g_vaildUncaughtExceptionHandler(exception);
}

void uncaughtExceptionHandler1(NSException *exception)
{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    NSLog(@"%@", exceptionInfo);
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:stackArray];
    [tmpArr insertObject:reason atIndex:0];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //保存到本地  --  当然你可以在下次启动的时候，上传这个log
    [exceptionInfo writeToFile:[NSString stringWithFormat:@"%@/error.log",path] atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
