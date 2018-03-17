//
//  Person.h
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger age;

- (NSString *)formatterTitle;

+ (NSArray<Person*>*)loadForPlist;

@end
