//
//  JSAPIRequestMethod.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPIRequestMethod.h"

@implementation JSAPIRequestMethod

+ (YTKRequestMethod)getRequestMethod:(JSApiManagerUrlCode)code{
    switch (code) {
        case UpdateTokenApiCode:
            return YTKRequestMethodPOST;
            break;
            
        default:
            return YTKRequestMethodGET;
            break;
    }
    return YTKRequestMethodGET;
}

@end
