//
//  JYBDRequestManager.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/1/24.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JYBDRequest;
@interface JYBDRequestManager : NSObject
+ (JYBDRequestManager *)sharedManager;
//添加请求以记录进行中的请求
- (void)addRequest:(JYBDRequest *)request;
//移除已完成的请求
- (void)removeRequest:(JYBDRequest *)request;
@end
