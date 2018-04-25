//
//  JSAPIRequestUrl.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYBDRequest.h"
#import "JSAPIManagerUrlCode.h"

@interface JSAPIRequestUrl : NSObject


/**
 返回对应的接口

 @param code url枚举
 @param urlParam url追加参数
 @return 返回接口地址
 */
+ (NSString*)getURL:(JSApiManagerUrlCode)code urlParam:(NSDictionary*)urlParam;


/**
 根据字典生成get参数

 @param parameters 参数字典
 @param rootUrl url地址
 @return 返回get参数
 */
+ (NSString*)getParameters:(NSDictionary*)parameters rootUrl:(NSString*)rootUrl;

@end
