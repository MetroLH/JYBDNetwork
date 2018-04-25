//
//  JSCostomLoading.h
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSCostomLoading : UIView
@property (nonatomic,strong) UILabel *tips;
-(void)start;

-(void)hide;

+(JSCostomLoading*)showIn:(UIView*)view;

+(JSCostomLoading*)hideIn:(UIView*)view;
@end
