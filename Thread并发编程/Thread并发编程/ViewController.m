//
//  ViewController.m
//  Thread并发编程
//
//  Created by pgq on 2018/3/17.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController


struct threadInfo {
    uint32_t *inputValues;
    size_t count;
};

struct threadResult{
    uint32_t min;
    uint32_t max;
};

void * findMinAndMax(void *arg){
    struct threadInfo const * info = (struct threadInfo *)arg;
    uint32_t min = UINT32_MAX;
    uint32_t max = 0;
    for (size_t i = 0; i < info->count; ++i) {
        uint32_t v = info->inputValues[i];
        min = MIN(min, v);
        max = MIN(max, v);
    }
    free(arg);
    struct threadResult * const result = (struct threadResult *) malloc(sizeof(*result));
    result->min = min;
    result->max = max;
    return result;
}

void begin(){
    
}

@end
