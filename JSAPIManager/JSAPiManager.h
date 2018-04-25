//
//  JSAPiManager.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JYBDRequest.h"
#import "JSAPIManagerUrlCode.h"
#import "JSAPIRequestUrl.h"
#import "JSAPIRequestMethod.h"
#import "JSAPIResponseSerializerType.h"
#import "JSAPIJsonValidator.h"

@interface JSAPiManager : JYBDRequest

/**
 初始化request对象

 @param arguments GET或POST参数
 @param model model
 @param urlCode url枚举
 @return 返回对象
 */
- (id)initWithDatas:(NSDictionary *)arguments model:(NSDictionary *)model urlCode:(JSApiManagerUrlCode)urlCode;


/**
 初始化request对象

 @param arguments GET或POST参数
 @param urlParam URL追加GET参数
 @param model model
 @param urlCode url枚举
 @return 返回对象
 */
- (id)initWithDatas:(NSDictionary *)arguments urlParam:(NSDictionary* )urlParam model:(NSDictionary *)model urlCode:(JSApiManagerUrlCode)urlCode;


/**
 初始化上传图片的request对象

 @param image 图片
 @param name 名称
 @param arguments 参数
 @param compressionQuality 压缩比(1为1m,2为2m，以此类推)
 @param urlCode url枚举
 @return 返回对象
 */
- (id)initWithImage:(UIImage *)image name:(NSString *)name arguments:(NSDictionary *)arguments compressionQuality:(CGFloat)compressionQuality urlCode:(JSApiManagerUrlCode)urlCode;

//获取上传进度
@property(nonatomic,copy) void(^uploadProgressBlock)(JSAPiManager *currentApi, NSProgress * progress);

@end
