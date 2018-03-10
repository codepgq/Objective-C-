//
//  MainController.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (IBAction)dataSourceBtnClick:(UIButton *)sender {
    [self pushController:@"TBViewController" title:sender.titleLabel.text];
}
- (IBAction)LogicBtnClick:(UIButton *)sender {
    [self pushController:@"LogicViewController" title:sender.titleLabel.text];
}
- (IBAction)storeBtnClick:(UIButton *)sender {
    [self pushController:@"StoreViewController" title:sender.titleLabel.text];
}
- (IBAction)networkBtnClick:(UIButton *)sender {
    [self pushController:@"NetworkViewController" title:sender.titleLabel.text];
}
- (IBAction)viewBtnClick:(UIButton *)sender {
    [self pushController:@"ViewCodeViewController" title:sender.titleLabel.text];
}

- (void)pushController:(NSString *)clsName title:(NSString *)title{
    UIViewController *vc = [[NSClassFromString(clsName) alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = title;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
