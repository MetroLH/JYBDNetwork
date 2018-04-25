//
//  JSAPIRequestMethod.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//  请求方式设置

#import <Foundation/Foundation.h>
#import "JYBDRequest.h"
#import "JSAPIManagerUrlCode.h"

@interface JSAPIRequestMethod : NSObject


/**
 根据相应的接口返回method类型

 @param code url枚举
 @return 返回method
 */
+ (YTKRequestMethod)getRequestMethod:(JSApiManagerUrlCode)code;

@end
