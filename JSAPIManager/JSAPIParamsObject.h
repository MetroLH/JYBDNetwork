//
//  JSAPIParamsObject.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/4/24.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSAPIParamsObject : NSObject

@property (nonatomic,strong)NSMutableDictionary* body;

//添加body
- (void)addBody:(id)value forKey:(NSString*)key;

//移除body
- (void)removeBodyWithKey:(NSString*)key;

@end
