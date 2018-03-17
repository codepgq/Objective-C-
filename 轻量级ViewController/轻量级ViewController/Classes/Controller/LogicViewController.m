//
//  LogicViewController.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

/*
 需求
    把Person的title首字母大写，并且加上日期,输出到控制台
 */

#import "LogicViewController.h"
#import "Person.h"
@interface LogicViewController ()

@end

@implementation LogicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [[Person alloc] init];
    p.title = @"xiaoming";
    NSLog(@"%@",[p formatterTitle]);
}
@end
