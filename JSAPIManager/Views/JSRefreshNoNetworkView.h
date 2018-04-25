//
//  JSRefreshNoNetworkView.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RCRefreshNoNetworkViewBlock)(void);

@interface JSRefreshNoNetworkView : UIView

@property (nonatomic, strong) UIImageView *tipImageView;

@property (nonatomic, strong) UILabel *tipLabel;

@property (nonatomic, strong) UIButton *tipButton;

@property(nonatomic, copy) RCRefreshNoNetworkViewBlock refreshNoNetworkViewBlock;

@end
