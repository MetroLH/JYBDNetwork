//
//  UIView+Loading.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/5.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "UIView+Loading.h"
static char LoadingViewKey;
static char NoNetworkView;
static char NoDataView;
static char RequestErrorView;
@implementation UIView (Loading)
- (void)setLoadingView:(JSCostomLoading *)loadingView{
    [self willChangeValueForKey:@"LoadingViewKey"];
    objc_setAssociatedObject(self, &LoadingViewKey,
                             loadingView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"LoadingViewKey"];
}

- (JSCostomLoading *)loadingView{
    return objc_getAssociatedObject(self, &LoadingViewKey);
}

- (void)setNoNetworkView:(JSRefreshNoNetworkView *)noNetworkView{
    [self willChangeValueForKey:@"NoNetworkView"];
    objc_setAssociatedObject(self, &NoNetworkView,
                             noNetworkView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"NoNetworkView"];
}

- (JSRefreshNoNetworkView *)noNetworkView{
    return objc_getAssociatedObject(self, &NoNetworkView);
}

- (void)setNoDataView:(JSRefreshNoDataView *)noDataView{
    [self willChangeValueForKey:@"NoDataView"];
    objc_setAssociatedObject(self, &NoDataView,
                             noDataView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"NoDataView"];
}

- (JSRefreshNoDataView *)noDataView{
    return objc_getAssociatedObject(self, &NoDataView);
}

- (void)setRequestErrorView:(JSRefreshRequestErrorView *)requestErrorView{
    [self willChangeValueForKey:@"RequestErrorView"];
    objc_setAssociatedObject(self, &RequestErrorView,
                             requestErrorView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"RequestErrorView"];
}

- (JSRefreshNoDataView *)requestErrorView{
    return objc_getAssociatedObject(self, &RequestErrorView);
}

- (void)beginLoading{
    if ([self isKindOfClass:[UITableView class]]) {
        UIScrollView *tableView = (UIScrollView *)self;
        tableView.scrollEnabled = NO;
    }
    [self.noNetworkView removeFromSuperview];
    [self.noDataView removeFromSuperview];
    [self.requestErrorView removeFromSuperview];
    
    if (!self.loadingView) { //初始化LoadingView
        self.loadingView = [[JSCostomLoading alloc] initWithFrame:self.bounds];
    }else{
        self.loadingView.frame = self.bounds;
    }
    NSLog(@"self.bounds = %f,%f,%f,%f",self.bounds.origin.x,self.bounds.origin.y,self.bounds.size.width,self.bounds.size.height);
    self.loadingView.alpha = 1.0;
    [self.loadingView start];
    [self addSubview:self.loadingView];
    [self.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
        make.top.mas_equalTo(self.bounds.origin.y);
        make.height.mas_equalTo(self.mas_height);
    }];
}

- (void)endLoading{
    if ([self isKindOfClass:[UITableView class]]) {
        UIScrollView *tableView = (UIScrollView *)self;
        tableView.scrollEnabled = YES;
    }
    if (self.loadingView) {
        [UIView animateWithDuration:0.3f
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.loadingView.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             [self.loadingView removeFromSuperview];
                         }];
    }
}

- (void)showTipView:(JSNetTipViewType)type reRequestBlock:(void(^)(void))block title:(NSString *)title{
    if ([self isKindOfClass:[UITableView class]]) {
        UIScrollView *tableView = (UIScrollView *)self;
        tableView.scrollEnabled = NO;
    }
    switch (type) {
        case JSErrorViewTypeNoNetwork:{
            [self.noNetworkView removeFromSuperview];
            if (!self.noNetworkView) {
                self.noNetworkView = [[JSRefreshNoNetworkView alloc] initWithFrame:self.bounds];
            }
            [self addSubview:self.noNetworkView];
            if (title) {
                self.noNetworkView.tipLabel.text = title;
            }
            if (block) {
                self.noNetworkView.refreshNoNetworkViewBlock = block;
            }
            [self.noNetworkView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.width.mas_equalTo(self.mas_width);
                make.top.mas_equalTo(self.bounds.origin.y);
                make.height.mas_equalTo(self.mas_height);
            }];
        }
            break;
        case JSErrorViewTypeRequest:{
            [self.requestErrorView removeFromSuperview];
            if (!self.requestErrorView) {
                self.requestErrorView = [[JSRefreshRequestErrorView alloc] initWithFrame:self.bounds];
            }
            [self addSubview:self.requestErrorView];
            if (title) {
                self.requestErrorView.tipLabel.text = title;
            }
            if (block) {
                self.requestErrorView.refreshRequestErrorViewBlock = block;
            }
            [self.requestErrorView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.width.mas_equalTo(self.mas_width);
                make.top.mas_equalTo(self.bounds.origin.y);
                make.height.mas_equalTo(self.mas_height);
            }];
        }
            break;
        case JSErrorViewTypeNoData:{
            [self.noDataView removeFromSuperview];
            if (!self.noDataView) {
                self.noDataView = [[JSRefreshNoDataView alloc] initWithFrame:self.bounds];
            }
            [self addSubview:self.noDataView];
            if (title) {
                self.noDataView.tipLabel.text = title;
            }
            if (block) {
                self.noDataView.refreshNoDataViewBlock = block;
            }
            [self.noDataView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.width.mas_equalTo(self.mas_width);
                make.top.mas_equalTo(self.bounds.origin.y);
                make.height.mas_equalTo(self.mas_height);
            }];
            
        }
            break;
            
        default:
            break;
    }
}

- (void)showTipView:(JSNetTipViewType)type reRequestBlock:(void(^)(void))block{
    [self showTipView:type reRequestBlock:block title:nil];
    
}

- (void)hideTipView:(JSNetTipViewType)type{
    [self.noNetworkView removeFromSuperview];
    [self.noDataView removeFromSuperview];
    [self.requestErrorView removeFromSuperview];
    [self.loadingView removeFromSuperview];
}
@end
