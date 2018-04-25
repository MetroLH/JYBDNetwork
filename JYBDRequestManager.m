//
//  JYBDRequestManager.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/1/24.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JYBDRequestManager.h"
#import "YTKNetwork.h"
#import <pthread/pthread.h>
#import "JYBDRequest.h"
#import "JYBDNetworkReachabilityManager.h"

#define Lock() pthread_mutex_lock(&_lock)
#define Unlock() pthread_mutex_unlock(&_lock)
@implementation JYBDRequestManager{
    //记录正在执行的请求
    NSMutableDictionary<NSNumber *, JYBDRequest *> *_jybdRequestsRecord;
    //互斥锁用用来防止对_jybdRequestsRecord进行删除添加操作多线程问题
    pthread_mutex_t _lock;
    //请求标识通过此标识能够快速的删除和查找
    NSInteger _jybdIdentifier;

}

+ (JYBDRequestManager *)sharedManager {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _jybdRequestsRecord = [NSMutableDictionary dictionary];
        pthread_mutex_init(&_lock, NULL);
        _jybdIdentifier = 0;
        [self converContentTypeConfig];
        [[JYBDNetworkReachabilityManager sharedManager] startMonitoring];
        __weak typeof(self) weakSelf = self;
        [[JYBDNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(JYBDNetworkReachabilityStatus s) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf handleReachabilityChanged:s];
        }];
        
    }
    return self;
}
//设置猿题库jsonResponseSerializer.acceptableContentTypes
- (void)converContentTypeConfig{
    YTKNetworkAgent *agent = [YTKNetworkAgent sharedAgent];
    NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", @"text/css", nil];
    NSString *keypath = @"jsonResponseSerializer.acceptableContentTypes";
    [agent setValue:acceptableContentTypes forKeyPath:keypath];
}
//添加请求以记录进行中的请求
- (void)addRequest:(JYBDRequest *)request{
    Lock();
    _jybdIdentifier ++;
    request.jybdIdentifier = _jybdIdentifier;
    _jybdRequestsRecord[@(request.jybdIdentifier)] = request;
    Unlock();
    
}
//移除已完成的请求
- (void)removeRequest:(JYBDRequest *)request{
    Lock();
    [_jybdRequestsRecord removeObjectForKey:@(request.jybdIdentifier)];
    NSLog(@"JYBDRequest queue size = %zd", [_jybdRequestsRecord count]);
    _jybdIdentifier --;
    Unlock();
}
//网络状态切换回调
- (void)handleReachabilityChanged:(JYBDNetworkReachabilityStatus)status {
    switch (status) {
        case JYBDNetworkReachabilityStatusNotReachable: {
            break;
        }
        case JYBDNetworkReachabilityStatusReachableViaWiFi: {
            NSLog(@"ReachabilityChanged JYBDNetworkReachabilityStatusReachableViaWiFi");
            [self restartAllRequest];
            break;
        }
        case JYBDNetworkReachabilityStatusReachableViaWWAN: {
            NSLog(@"ReachabilityChanged JYBDNetworkReachabilityStatusReachableViaWWAN");
            [self restartAllRequest];

            break;
        }
        default: {
            break;
        }
    }

}
//重新请求
-(void)restartAllRequest{
    Lock();
    NSArray *allKeys = [_jybdRequestsRecord allKeys];
    NSLog(@"allKeys count = %lu",(unsigned long)allKeys.count);
    Unlock();
    if (allKeys && allKeys.count > 0) {
        NSArray *copiedKeys = [allKeys copy];
        for (NSNumber *key in copiedKeys) {
            Lock();
            JYBDRequest *request = _jybdRequestsRecord[key];
            Unlock();
            // We are using non-recursive lock.
            // Do not lock `stop`, otherwise deadlock may occur.
            [request resume];
        }
    }
}


@end
