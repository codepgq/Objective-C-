//
//  ViewController.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "TBViewController.h"
#import "TBDataSource.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height

@interface TBViewController ()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *items2;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView2;
@end

@implementation TBViewController{
    TBDataSource *dataSource1;
    TBDataSource *dataSource2;
}

#pragma mark - 显示View
- (void)loadView{
    [super loadView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView2];
}

#pragma mark - 初始化View
static NSString * const CellIdenfier = @"cell";
- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenheight * 0.5) style:(UITableViewStylePlain)];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdenfier];
        dataSource1 = [TBDataSource dataSourceWithIdentifier:CellIdenfier items:self.items configureCell:^(UITableViewCell *cell, NSString * item) {
            cell.textLabel.text = item;
        }];
        _tableView.dataSource = dataSource1;
    }
    return _tableView;
}

- (UITableView *)tableView2{
    if (!_tableView2){
        _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenheight * 0.5, kScreenWidth, kScreenheight * 0.5) style:(UITableViewStyleGrouped)];
        [_tableView2 registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdenfier];
        dataSource2 = [TBDataSource dataSourceWithIdentifier:CellIdenfier items:self.items2 configureCell:^(UITableViewCell *cell, NSString * item) {
            cell.textLabel.textColor = [UIColor orangeColor];
            cell.textLabel.text = item;
        }];
        _tableView2.dataSource = dataSource2;
    }
    return _tableView2;
}

#pragma mark - 加载数据
- (NSMutableArray *)items{
    if (!_items){
        _items = [@[@"A",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"0",@"0"] mutableCopy];
    }
    return _items;
}

- (NSMutableArray *)items2{
    if (!_items2){
        _items2 = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            [_items2 addObject:[@[@"A",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"0",@"0"] mutableCopy]];
        }
    }
    return _items2;
}



@end
