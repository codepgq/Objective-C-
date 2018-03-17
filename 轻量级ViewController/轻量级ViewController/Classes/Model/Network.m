//
//  Network.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/16.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "Network.h"

@interface Network()
@property (nonatomic, copy) void(^imageBlock)(UIImage* image);
@end

@implementation Network

+ (Network*)dowloadImageForURL:(NSURL *)url compteion:(void(^)(UIImage* image))completion{
    Network *net = [Network new];
    net.imageBlock = completion;
    [net beginDownload:url];
    return net;
}

- (void)beginDownload:(NSURL *)url{
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                if (self.imageBlock) {
                    self.imageBlock([self addWaterTextToImage:[UIImage imageWithData:data]]);
                }
            }
            NSLog(@"%@",error);
        });
    }] resume];
}

- (UIImage *)addWaterTextToImage:(UIImage *)image{
    if (!image) {
        return [UIImage new];
    }
    
    UIGraphicsBeginImageContext(image.size);
    
    [image drawAtPoint:CGPointZero];
    NSString * waterStr = @"从网络下载";
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //NSFontAttributeName:字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    //字体前景色
    dict[NSForegroundColorAttributeName] = [UIColor colorWithWhite:1 alpha:0.3];
    //字体背景色
    //    dict[NSBackgroundColorAttributeName] = [UIColor redColor];
    //字体阴影
    NSShadow * shadow = [[NSShadow alloc]init];
    //阴影偏移量
    shadow.shadowOffset = CGSizeMake(2, 2);
    //阴影颜色
    shadow.shadowColor = [UIColor greenColor];
    //高斯模糊
    shadow.shadowBlurRadius = 5;
    
    dict[NSShadowAttributeName] = shadow;
    //字体间距
    dict[NSKernAttributeName] = @30;
    
    [waterStr drawInRect:(CGRectMake(0, 200, image.size.width, image.size.height)) withAttributes:dict];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
