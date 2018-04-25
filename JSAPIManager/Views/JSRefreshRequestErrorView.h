//
//  JSRefreshRequestErrorView.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RCRefreshRequestErrorViewBlock)();

@interface JSRefreshRequestErrorView : UIView

@property (nonatomic, strong) UIImageView *tipImageView;

@property (nonatomic, strong) UILabel *tipLabel;

@property (nonatomic, strong) UIButton *tipButton;

@property(nonatomic, copy) RCRefreshRequestErrorViewBlock refreshRequestErrorViewBlock;

@end
