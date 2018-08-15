//
//  ViewController.m
//  CatchCrash
//
//  Created by steve on 2018/7/9.
//  Copyright © 2018年 liuguojun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.backgroundColor = [UIColor orangeColor];
    button1.frame = CGRectMake(70, 100, 250, 40);
    [button1 setTitle:@"crashTapped" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(crashTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.backgroundColor = [UIColor orangeColor];
    button2.frame = CGRectMake(70, 170, 250, 40);
    [button2 setTitle:@"killMemory" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(killMemory) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}


#pragma mark - 单击事件
- (void)crashTapped
{
    //常见异常1---不存在方法引用
    //    [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    
    //常见异常2---键值对引用nil
    //    [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    
    //常见异常3---数组越界
    [[NSArray array] objectAtIndex:1];
    
    //常见异常4---memory warning 级别3以上
    //    [self performSelector:@selector(killMemory) withObject:nil];
    
    //其他大家去想吧
}

#pragma mark - custom method
- (void)killMemory
{
    for (int i = 0; i < 3000; i ++)
    {
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        tmpLabel.layer.masksToBounds = YES;
        tmpLabel.layer.cornerRadius = 10;
        tmpLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:tmpLabel];
    }
    NSLog(@"1111");
}

@end
