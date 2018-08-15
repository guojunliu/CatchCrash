//
//  CatchCrash.h
//  CatchCrash
//
//  Created by steve on 2018/7/9.
//  Copyright © 2018年 liuguojun. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSUncaughtExceptionHandler *g_vaildUncaughtExceptionHandler;

@interface CatchCrash : NSObject

void uncaughtExceptionHandler(NSException *exception);

void uncaughtExceptionHandler1(NSException *exception);

@end
