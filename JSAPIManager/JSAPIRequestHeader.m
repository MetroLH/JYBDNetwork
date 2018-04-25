//
//  JSAPIRequestHeader.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/4/4.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPIRequestHeader.h"
#import "JSUserManage.h"
#import "UUIDUtils.h"
@implementation JSAPIRequestHeader

/**
 根据相应的接口添加不同的http请求header
 
 @param code url枚举
 @return 返回header字典
 */
+ (NSDictionary *)getRequestHeaderFieldValueDictionary:(JSApiManagerUrlCode)code{
    switch (code) {
            
        default:
            return @{@"cliversion":VERSION ?: @"",@"clitype":@"iOS",@"deviceid":[UUIDUtils getUUID] ?: @"",@"token":[JSUserManage shareInstance].user.appkey ?: @""};
            break;
    }
}
@end
