//
//  TBDataSource.h
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TBDataSourceCellBlock)(UITableViewCell *cell, id item);

@interface TBDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, strong) NSMutableArray *items;

+ (instancetype)dataSourceWithIdentifier:(NSString *)identifier items:(NSMutableArray *)items configureCell:(TBDataSourceCellBlock)block;

@end
