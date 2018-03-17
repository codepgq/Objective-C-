//
//  Person.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)formatterTitle{
    char c = [_title characterAtIndex:0];
    c -= 32;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年mm月dd日 HH:MM:ss.SSS ZZZ";
    NSString *dateString = [formatter stringFromDate:[[NSDate alloc] init]];
    
    _title = [NSString stringWithFormat:@"%c%@ %@",c,[_title substringFromIndex:1],dateString];
    return _title;
}

+ (NSArray<Person*>*)loadForPlist{
    NSMutableArray *persons = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Person.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    [array enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Person *p = [[Person alloc] init];
        [p setValuesForKeysWithDictionary:obj];
        [persons addObject:p];
    }];
    return persons;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"title=%@ age=%zd",_title,_age];
}

@end
