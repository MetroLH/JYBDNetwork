//
//  JSRefreshNoNetworkView.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSRefreshNoNetworkView.h"

@implementation JSRefreshNoNetworkView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
        [self addSubview:self.tipImageView];
        [self addSubview:self.tipLabel];
        [self addSubview:self.tipButton];
        //        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        //        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.tipImageView.frame = CGRectMake((self.frame.size.width - 60)/2, (self.frame.size.height - 200)/2, 60, 60);
    self.tipLabel.frame = CGRectMake(0, self.tipImageView.frame.origin.y + self.tipImageView.frame.size.height + 20, self.frame.size.width, 20);
    self.tipButton.frame = CGRectMake((self.frame.size.width - 100)/2, self.tipLabel.frame.origin.y + self.tipLabel.frame.size.height + 10, 100, 30);
}

- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"client_null"]];
    }
    return _tipImageView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.text = @"网络连接异常, 重新检查网络吧";
        _tipLabel.font = [UIFont systemFontOfSize:15];
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.numberOfLines = 0;
    }
    return _tipLabel;
}

- (UIButton *)tipButton {
    if (!_tipButton) {
        _tipButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_tipButton setTitle:@"点击刷新" forState: UIControlStateNormal];
        [_tipButton setTitleColor:YELLOW_COLOR forState:UIControlStateNormal];
        _tipButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _tipButton.layer.cornerRadius = 5;
        _tipButton.clipsToBounds = YES;
        _tipButton.layer.borderWidth = 1.0f;
        _tipButton.layer.borderColor = YELLOW_COLOR.CGColor;
        [_tipButton addTarget:self action:@selector(tipButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tipButton;
}

- (void)tipButtonClick:(UIButton *)button {
    //    [RCAlertView showLoadingWithTitle:kLoading inView:self.superview.superview];
    !self.refreshNoNetworkViewBlock ?: self.refreshNoNetworkViewBlock();
}

@end
