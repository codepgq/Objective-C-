//
//  StoreViewController.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

/*
 需求：
    从Plist文件中加载对象，并且输出到控制台中。
 */

#import "StoreViewController.h"
#import "Person.h"


@interface StoreViewController ()

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[Person loadForPlist]);
}
@end
