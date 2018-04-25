//
//  JSAPiManager.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPiManager.h"
#import "UIImage+WLCompress.h"
#import "JSAPIRequestHeader.h"

@interface JSAPiManager()
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,assign)CGFloat acompressionQuality;
@property(nonatomic,copy)NSString *name;
@end

@implementation JSAPiManager{
    NSDictionary *_arguments;
    NSDictionary *_urlParam;
    JSApiManagerUrlCode _urlCode;
}

- (id)initWithDatas:(NSDictionary *)arguments model:(NSDictionary *)model urlCode:(JSApiManagerUrlCode)urlCode {
    self = [super init];
    if (self) {
        _arguments = arguments;
        _urlCode = urlCode;
    }
    return self;
}

- (id)initWithDatas:(NSDictionary *)arguments urlParam:(NSDictionary* )urlParam model:(NSDictionary *)model urlCode:(JSApiManagerUrlCode)urlCode{
    self = [super init];
    if (self) {
        _arguments = arguments;
        _urlCode = urlCode;
        _urlParam = urlParam;
    }
    return self;
}

- (id)initWithImage:(UIImage *)image name:(NSString *)name arguments:(NSDictionary *)arguments compressionQuality:(CGFloat)compressionQuality  urlCode:(JSApiManagerUrlCode)urlCode{
    self = [super init];
    if (self) {
        _arguments = arguments;
        _urlCode = urlCode;
        _image = image;
        _name = name;
        _acompressionQuality = compressionQuality;
        self.resumableUploadProgressBlock = [self resumableUploadProgressBlock];
    }
    return self;
}

//url请求路径设置
- (NSString *)requestUrl {
    return [JSAPIRequestUrl getURL:_urlCode urlParam:_urlParam];
}
//请求方式设置
- (YTKRequestMethod)requestMethod {
    return [JSAPIRequestMethod getRequestMethod:_urlCode];
}

//数据验证为返回数据格式
- (id)jsonValidator {
    return [JSAPIJsonValidator getJsonValidator:_urlCode];
}
//解析类型设置
-(YTKResponseSerializerType)responseSerializerType {
    return [JSAPIResponseSerializerType getResponseSerializerType:_urlCode];
}

//请求参数测试
- (id)requestArgument {
    return _arguments;
}
//设置http请求头
- (NSDictionary *)requestHeaderFieldValueDictionary {
    return [JSAPIRequestHeader getRequestHeaderFieldValueDictionary:_urlCode];
}


//设置上传图片 所需要的 HTTP HEADER
- (AFConstructingBlock)constructingBodyBlock {
    if (_uploadProgressBlock) {
        kWeakSelf;
        return ^(id<AFMultipartFormData> formData) {
//            NSData *data=UIImageJPEGRepresentation(_image, _acompressionQuality);
            if (_acompressionQuality == 0) {
                _acompressionQuality = 1;
            }
            NSData* fileData = [_image compressWithLengthLimit:(_acompressionQuality * 1000.0f) * 1024.0f];
            NSLog(@"压缩数据大小:%.4f MB",(double)fileData.length/1024.0f/1024.0f);
            NSString *fileName=@"";
            NSDate* date = [NSDate date];
            NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
            [dateformatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *timeStr=[dateformatter stringFromDate:date];
            fileName=[NSString stringWithFormat:@"%@.jpg",timeStr];
            NSString *type = @"image/jpeg";
            [formData appendPartWithFileData:fileData name:weakSelf.name fileName:fileName mimeType:type];
        };
    }
    return ^(id<AFMultipartFormData> formData) {
        
    };;
}
#pragma mark 上传进度
- (AFURLSessionTaskProgressBlock) resumableUploadProgressBlock
{
    AFURLSessionTaskProgressBlock block = ^void(NSProgress * progress){
        if (_uploadProgressBlock) {
            _uploadProgressBlock(self,progress);
        }
    };
    return block;
}
//override 基类startWithCompletionBlockWithSuccess方法
- (void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure {
    [super startWithCompletionBlockWithSuccess:success failure:failure];
    switch (_urlCode) {
        case CollectApiCode:
            break;
        default:{
            NSLog(@"\n%@\n\n%@\n\n%@\n",NetworkSeparator,[self description],NetworkSeparatorWithFlag);
        }
            break;
    }
}
@end
