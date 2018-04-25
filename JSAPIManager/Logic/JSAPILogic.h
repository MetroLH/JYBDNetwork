//
//  JSAPILogic.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/4/25.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YTKBaseRequest;
@interface JSAPILogic : NSObject

//基础网络数据解析
+ (id)networkAnalysis:(__kindof YTKBaseRequest *)request notifyCallBack:(JSNotifyCallback)callback;
+ (id)networkAnalysis:(__kindof YTKBaseRequest *)request notifyCallBack:(JSNotifyCallback)callback disMissAlert:(BOOL)aswich;
+ (id)networkAnalysis:(__kindof YTKBaseRequest *)request preView:(UIView *)view reRequestBlock:(void(^)(void))block notifyCallBack:(JSNotifyCallback)callback;

@end
