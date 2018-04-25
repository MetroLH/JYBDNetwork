//
//  JSAPIResponseSerializerType.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPIResponseSerializerType.h"

@implementation JSAPIResponseSerializerType

+ (YTKResponseSerializerType)getResponseSerializerType:(JSApiManagerUrlCode)code{
    return YTKResponseSerializerTypeJSON;
}

@end
