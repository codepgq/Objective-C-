//
//  ViewCodeViewController.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

/*
 需求：
    创建一个用户头像视图：
        左边是头像，右边是上下两行信息
 要求头像可点击
 */

#import "ViewCodeViewController.h"

#import "UserHeaderView.h"
@interface ViewCodeViewController ()

@end

@implementation ViewCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserHeaderView *header = [[UserHeaderView alloc] initWithFrame:CGRectMake(0, 300, 300, 150)];
    [self.view addSubview:header];
}
@end
