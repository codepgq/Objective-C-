//
//  TBDataSource.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "TBDataSource.h"

@interface TBDataSource()
@property (nonatomic, assign) BOOL isHasSections;
@property (nonatomic, strong) TBDataSourceCellBlock configureCellBlock;
@end

@implementation TBDataSource

+ (instancetype)dataSourceWithIdentifier:(NSString *)identifier items:(NSMutableArray *)items configureCell:(TBDataSourceCellBlock)block{
    TBDataSource *source = [[TBDataSource alloc] init];
    source.items = [items copy];
    source.identifier = identifier;
    source.configureCellBlock = block;
    if ([items.firstObject isKindOfClass:[NSArray class]] || [items.firstObject isKindOfClass:[NSMutableArray class]] ) {
        source.isHasSections = YES;
    }
    return source;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isHasSections) {
        return self.items[indexPath.section][indexPath.row];
    }
    return self.items[indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.isHasSections) {
        return self.items.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.isHasSections) {
        return [self.items[section] count];
    }
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:self.identifier];
    }
    id item = [self itemAtIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell,item);
    }
    return cell;
}

@end
