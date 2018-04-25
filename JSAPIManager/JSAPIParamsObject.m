//
//  JSAPIParamsObject.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/4/24.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPIParamsObject.h"

@implementation JSAPIParamsObject

- (id)init{
    self = [super init];
    if (self) {
        _body = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addBody:(id)value forKey:(NSString*)key{
    if (!_body) {
        return;
    }
    [_body setObject:value?value:@"" forKey:key];
}

- (void)removeBodyWithKey:(NSString*)key{
    if (!_body) {
        return;
    }
    [_body removeObjectForKey:key];
}

@end
