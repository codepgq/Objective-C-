//
//  UserHeaderView.m
//  轻量级ViewController
//
//  Created by pgq on 2018/3/16.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "UserHeaderView.h"

@implementation UserHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}

- (void)setup:(CGRect)frame{
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    UIButton *iconBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width * 0.5, height)];
    [iconBtn setImage:[UIImage imageNamed:@"4.jpeg"] forState:UIControlStateNormal];
    [iconBtn addTarget:self action:@selector(iconButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *topLabel = [self createLabelWithFontSize:17 text:@"名称" textColor:[UIColor orangeColor] alignment:NSTextAlignmentLeft];
    UILabel *bottomLabel = [self createLabelWithFontSize:13 text:@"个人信息...................................................................................................................................." textColor:[UIColor grayColor] alignment:NSTextAlignmentLeft];

    topLabel.frame = CGRectMake(width * 0.5, 0, width * 0.5, height * 0.3);
    bottomLabel.frame = CGRectMake(width * 0.5, height * 0.3, width * 0.5, height * 0.7);
    
    [self addSubview:iconBtn];
    [self addSubview:topLabel];
    [self addSubview:bottomLabel];
}

- (void)iconButtonClick:(UIButton *)button{
    NSLog(@"%s",__func__);
}

- (UILabel *)createLabelWithFontSize:(CGFloat)size text:(NSString *)text textColor:(UIColor *)color alignment:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.text = text;
    label.textAlignment = alignment;
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = 0;
    return label;
}

@end
