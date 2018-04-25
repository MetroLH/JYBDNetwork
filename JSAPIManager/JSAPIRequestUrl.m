//
//  JSAPIRequestUrl.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//  url请求路径设置

#import "JSAPIRequestUrl.h"

@implementation JSAPIRequestUrl

+ (NSString*)getURL:(JSApiManagerUrlCode)code urlParam:(NSDictionary *)urlParam{
    switch (code) {
        case UpdateTokenApiCode:
            return @"storeapi/index.php?act=store_member&op=uptoken";
            break;
        default:
            return @"";
            break;
    }
    return @"";
}

//生成GET请求参数
+ (NSString*)getParameters:(NSDictionary*)parameters rootUrl:(NSString*)rootUrl{
    NSMutableString* resultStr = [NSMutableString stringWithString:rootUrl];
    
    if (parameters && parameters.count > 0) {
        NSArray* allKeys = [parameters allKeys];
        NSRange range = [rootUrl rangeOfString:@"?"];
        for (NSString* key in allKeys) {
            if (range.location == NSNotFound) {
                if ([key isEqualToString:[allKeys firstObject]]) {
                    [resultStr appendFormat:@"?%@=%@",key,[parameters objectForKey:key]];
                }else{
                    [resultStr appendFormat:@"&%@=%@",key,[parameters objectForKey:key]];
                }
            }else{
                [resultStr appendFormat:@"&%@=%@",key,[parameters objectForKey:key]];
            }
        }
    }
    
    return resultStr;
}

@end
