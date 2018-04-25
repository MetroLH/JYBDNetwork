//
//  JSAPIResponseObject.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/4/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JSAPIReponseCode) {
    on_success                      =1,  //成功
    on_field                        =0,  //失败
    on_loginLose                    =409,//登录失效
    on_bigMoney                     =521,//代下单超额（>50万）
};

@interface JSAPIResponseObject : NSObject

@property (nonatomic,assign)    JSAPIReponseCode code;      //接口返回码
@property (nonatomic,copy)      NSString* msg;              //接口返回信息
@property (nonatomic,strong)    NSObject* result;           //接口返回数据
@property (nonatomic,copy)      NSString* url;              //返回整个请求接口

@end
