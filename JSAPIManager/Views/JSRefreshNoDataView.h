//
//  JSRefreshNoDataView.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RCRefreshNoDataViewBlock)(void);

@interface JSRefreshNoDataView : UIView

@property (nonatomic, strong) UIImageView *tipImageView;

@property (nonatomic, strong) UILabel *tipLabel;

@property (nonatomic, strong) UIButton *tipButton;

@property(nonatomic, copy) RCRefreshNoDataViewBlock refreshNoDataViewBlock;

@end
