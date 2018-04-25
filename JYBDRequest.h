//
//  JYBDRequest.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/1/24.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "YTKNetwork.h"

@interface JYBDRequest : YTKRequest
//甲乙丙丁请求标识用来标识正在执行的请求，通过该标识可以对JYBDRequestManager记录的请求进行删除操作
@property (nonatomic, assign) NSUInteger jybdIdentifier;

@end
