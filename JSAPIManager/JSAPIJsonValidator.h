//
//  JSAPIJsonValidator.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//  数据验证为返回数据格式

#import <Foundation/Foundation.h>
#import "JYBDRequest.h"
#import "JSAPIManagerUrlCode.h"

@interface JSAPIJsonValidator : NSObject


/**
 根据相应的接口做数据验证

 @param code url枚举
 @return 返回验证数据格式
 */
+ (id)getJsonValidator:(JSApiManagerUrlCode)code;

@end
