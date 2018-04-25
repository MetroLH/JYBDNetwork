//
//  UIView+Loading.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/5.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSCostomLoading.h"
#import "JSRefreshNoDataView.h"
#import "JSRefreshNoNetworkView.h"
#import "JSRefreshRequestErrorView.h"
typedef NS_ENUM(NSInteger, JSNetTipViewType) {
    JSViewTypeDefalt,
    JSErrorViewTypeNoNetwork,      //没有网络
    JSErrorViewTypeRequest,        //请求接口 后台报错
    JSErrorViewTypeNoData          //当前页面没有数据
};
@interface UIView (Loading)
@property (strong, nonatomic) JSCostomLoading *loadingView;
@property (strong, nonatomic) JSRefreshNoDataView *noDataView;
@property (strong, nonatomic) JSRefreshNoNetworkView *noNetworkView;
@property (strong, nonatomic) JSRefreshRequestErrorView *requestErrorView;
- (void)beginLoading;
- (void)endLoading;
- (void)showTipView:(JSNetTipViewType)type reRequestBlock:(void(^)(void))block;
- (void)showTipView:(JSNetTipViewType)type reRequestBlock:(void(^)(void))block title:(NSString *)title;
- (void)hideTipView:(JSNetTipViewType)type;
@end
