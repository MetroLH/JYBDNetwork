//
//  JSAPIResponseSerializerType.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//  解析类型设置

#import <Foundation/Foundation.h>
#import "JYBDRequest.h"
#import "JSAPIManagerUrlCode.h"

@interface JSAPIResponseSerializerType : NSObject


/**
 根据相应的接口返回response数据格式类型

 @param code url枚举
 @return SerializerType
 */
+ (YTKResponseSerializerType)getResponseSerializerType:(JSApiManagerUrlCode)code;

@end
