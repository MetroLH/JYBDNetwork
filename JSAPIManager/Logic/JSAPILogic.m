//
//  JSAPILogic.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/4/25.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPILogic.h"
#import "YTKNetwork.h"
#import "JSNavigationController.h"
#import "JSLoginController.h"
#import "ShowAlert.h"

static BOOL isShowUserStateAlert;

@implementation JSAPILogic

//基础网络数据解析
+ (id)networkAnalysis:(__kindof YTKBaseRequest *)request notifyCallBack:(JSNotifyCallback)callback disMissAlert:(BOOL)aswich{
    if (aswich) {
        [JSProgressHUD dismissProgressHUD];
    }
    return [JSAPILogic networkAnalysis:request preView:nil reRequestBlock:nil notifyCallBack:callback];
}

//基础网络数据解析
+ (id)networkAnalysis:(__kindof YTKBaseRequest *)request notifyCallBack:(JSNotifyCallback)callback{
    return [JSAPILogic networkAnalysis:request notifyCallBack:callback disMissAlert:YES];
}

//基础网络数据解析
+ (id)networkAnalysis:(__kindof YTKBaseRequest *)request preView:(UIView *)view reRequestBlock:(void(^)(void))block notifyCallBack:(JSNotifyCallback)callback{
    if (view) {
        [view endLoading];
    }else{
        [JSProgressHUD dismissProgressHUD];
    }
    if (request.error) {
        switch (request.error.code) {
            case NSURLErrorNotConnectedToInternet:{
                if (view) {
                    [view showTipView:JSErrorViewTypeNoNetwork reRequestBlock:block];
                }else{
                    [JSProgressHUD showErrorWithStatus:@"未连接到互联网，请检查网络！" duration:2];
                }
            }
                break;
            case NSURLErrorCannotConnectToHost:{
                if (view) {
                    [view showTipView:JSErrorViewTypeRequest reRequestBlock:block];
                }else{
                    [JSProgressHUD showErrorWithStatus:@"未能链接到服务器！" duration:2];
                }
            }
                break;
            case NSURLErrorTimedOut:{
                if (view) {
                    [view showTipView:JSErrorViewTypeRequest reRequestBlock:block title:@"链接超时，请检查网络！"];
                }else{
                    [JSProgressHUD showErrorWithStatus:@"链接超时，请检查网络！" duration:2];
                }
            }
                break;
            case 3840:{
                if (view) {
                    [view showTipView:JSErrorViewTypeRequest reRequestBlock:block];
                }else{
                    [JSProgressHUD showErrorWithStatus:@"返回错误数据！" duration:2];
                    
                }
            }
                break;
            case -1003:{
                if (view) {
                    [view showTipView:JSErrorViewTypeRequest reRequestBlock:block title:@"未能找到使用指定主机名的服务器！"];
                }else{
                    [JSProgressHUD showErrorWithStatus:@"未能找到使用指定主机名的服务器！" duration:2];
                }
            }
                break;
                
            default:{
                if (view) {
                    [view showTipView:JSErrorViewTypeRequest reRequestBlock:block title:@"您的网络不太稳定，请检查网络！"];
                }else{
                    [JSProgressHUD showErrorWithStatus:@"您的网络不太稳定，请检查网络！" duration:2];
                }
            }
                break;
        }
    }else{
        JSAPIResponseObject* object = [JSAPIResponseObject new];
        NSDictionary* responseDict = (NSDictionary*)request.responseJSONObject;
        object.code = [[responseDict safeObjectForKey:@"code"] integerValue];
        object.msg = [responseDict safeObjectForKey:@"msg"];
        object.url = [NSString stringWithFormat:@"%@%@",HTTP_WEBSITE,request.requestUrl];
        if ([responseDict objectForKey:@"result"] && ![[responseDict objectForKey:@"result"] isEqual:[NSNull null]]) {
            object.result = [responseDict objectForKey:@"result"];
        }
        
        switch (object.code) {
            case on_loginLose:{
                if (!isShowUserStateAlert) {
                    isShowUserStateAlert = YES;
                    [[ShowAlert share] showAlertWithTitle:@"提示"
                                                  message:object.msg
                                              okbuttonStr:@"重新登录"
                                             cancelBtnStr:nil
                                                okHandler:^(UIAlertAction *action) {
                                                    isShowUserStateAlert = NO;
                                                    [[JSUserManage shareInstance] userLogout];
                                                } cancelHanlder:^(UIAlertAction * _Nullable action) {
                                                    isShowUserStateAlert = NO;
                                                }];
                }
            }
                break;
            case on_bigMoney:{
                if (!isShowUserStateAlert) {
                    isShowUserStateAlert = YES;
                    [[ShowAlert share] showAlertWithTitle:@"提示"
                                                  message:object.msg
                                              okbuttonStr:@"确定"
                                             cancelBtnStr:nil
                                                okHandler:^(UIAlertAction *action) {
                                                    isShowUserStateAlert = NO;
                                                } cancelHanlder:^(UIAlertAction * _Nullable action) {
                                                    isShowUserStateAlert = NO;
                                                }];
                }
            }
                break;
            default:
                return object;
                break;
        }
    }
    
    //        if (code1 == 408)
    //        {
    //            [JSUserManage shareInstance].user = nil;
    //            [[JSUserManage shareInstance] saveUserInfo];
    //            [JPUSHService setAlias:@"sjb_ios" completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
    //                if (iResCode == 0) {
    //                    //设置别名成功
    //                    NSLog(@"logout iAlias = %@",iAlias);
    //
    //                }
    //            } seq:0];
    //
    //            [[CollectManager shareManager] addVCWithAction:@"logout" vcname:[NSString stringWithFormat:@"%@",[self class]]];
    //
    //            JSNavigationController *navController = [[JSNavigationController alloc] initWithRootViewController:[[JSLoginController alloc] init]];
    //
    //            UIApplication *application = [UIApplication sharedApplication];
    //            UIWindow *window = application.keyWindow;
    //            window.rootViewController = navController;
    //        }
    //        else
    //        {
    //            return request.responseJSONObject;
    //        }
    //
    //        return request.responseJSONObject;
    //    }
    return nil;
}

@end
