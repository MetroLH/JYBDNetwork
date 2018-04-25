//
//  JSRefreshNoDataView.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSRefreshNoDataView.h"

@implementation JSRefreshNoDataView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
        [self addSubview:self.tipImageView];
        [self addSubview:self.tipLabel];
        [self addSubview:self.tipButton];
//        [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).with.offset(self.bounds.size.width/2.0f-50);
//            make.top.equalTo(self).with.offset(self.bounds.size.height/2.0-50);
//            make.right.equalTo(self).with.offset(self.bounds.size.width/2.0f-50);
//        }];
//        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).with.offset(self.bounds.size.width/2.0f-10);
//            make.top.equalTo(self).with.offset(self.bounds.size.height/2.0);
//            make.right.equalTo(self).with.offset(self.bounds.size.width/2.0f-10);
//        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.tipImageView.frame = CGRectMake((self.bounds.size.width - 100)/2-5, (self.bounds.size.height - 200)/2, 100, 100);
    self.tipLabel.frame = CGRectMake((self.bounds.size.width - 160)/2-2, self.tipImageView.frame.origin.y + self.tipImageView.frame.size.height-10, 160, 30);
    self.tipButton.frame = CGRectMake((self.frame.size.width - 100)/2, self.tipLabel.frame.origin.y + self.tipLabel.frame.size.height + 10, 100, 30);
}

- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"not_data"]];
        _tipImageView.frame = CGRectMake(0, 0, 100, 100);
    }
    return _tipImageView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
        _tipLabel.text = @"暂无数据";
        _tipLabel.font = [UIFont systemFontOfSize:14];
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [UIColor clearColor];
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
    !self.refreshNoDataViewBlock ?: self.refreshNoDataViewBlock();
}


@end
