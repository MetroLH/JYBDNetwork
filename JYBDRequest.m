//
//  JYBDRequest.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/1/24.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JYBDRequest.h"
#import "JYBDRequestManager.h"
@implementation JYBDRequest

-(void)start{
    [[JYBDRequestManager sharedManager] addRequest:self];
    [super start];
}

-(void)stop{
    [[JYBDRequestManager sharedManager] removeRequest:self];
    [super stop];
}

- (void)clearCompletionBlock{
    NSLog(@"JYBDRequest clearCompletionBlock");
    [[JYBDRequestManager sharedManager] removeRequest:self];
    [super clearCompletionBlock];
}

@end
