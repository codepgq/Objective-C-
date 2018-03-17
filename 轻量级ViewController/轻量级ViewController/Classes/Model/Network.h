//
//  Network.h
//  轻量级ViewController
//
//  Created by pgq on 2018/3/16.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Network : NSObject

+ (Network*)dowloadImageForURL:(NSURL *)url compteion:(void(^)(UIImage* image))completion;

@end
