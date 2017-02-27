//
//  HttpExtension.h
//  ChinaMobileLogistic-master
//
//  Created by Tom-MAC on 16/6/27.
//  Copyright © 2016年 developer. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(NSDictionary *data);
typedef void (^FailureBlock)(NSError *error);
typedef void (^SuccessBlocks)(NSDictionary *data);
typedef void (^FailureBlocks)(NSError *error);
@interface HttpExtension : NSObject
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)getWithURLString:(NSString *)urlString
              parameters:(id)parameters
                 success:(SuccessBlock)successBlock
                 failure:(FailureBlock)failureBlock;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)postWithURLString:(NSString *)urlString
               parameters:(id)parameters
                  success:(SuccessBlock)successBlock
                  failure:(FailureBlock)failureBlock;


+ (void)postWithURLStringdd:(NSString *)urlString
               parameters:(id)parametersddd
                  success:(SuccessBlock)successBlockddd
                  failure:(FailureBlock)failureBlockddd;

@end
