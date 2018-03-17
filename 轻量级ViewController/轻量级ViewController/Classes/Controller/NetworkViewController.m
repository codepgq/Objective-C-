//
//  NetworkViewController.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/10.
//  Copyright © 2018年 pgq. All rights reserved.
//

/*
 需求：
    从网络下载一张图片，然后给图片添加水印之后，显示到UI上
 */

#import "NetworkViewController.h"
#import "Network.h"
@interface NetworkViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

static NSString * const IMAGEURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521190881917&di=1d5a8fe1d01e5bb3b3e6bc3ce540f0ab&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F7%2F54a3c16260c0f.jpg";

@implementation NetworkViewController{
    Network *_network;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_imageView];
    
    __weak typeof(self) ws = self;
    _network = [Network dowloadImageForURL:[NSURL URLWithString:IMAGEURL] compteion:^(UIImage *image) {
        ws.imageView.image = image;
    }];
}

@end
