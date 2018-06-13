//
//  LXNetWorkHelper.h
//  Network
//
//  Created by DHSD on 2018/6/13.
//  Copyright © 2018年 DHSD. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^LXCompletioBlock)(id resultData, NSURLResponse *response, NSError *error);
typedef void (^LXSuccessBlock)(id resultData);
typedef void (^LXFailureBlock)(NSError *error);

/**
 9.0～之后的网络请求
 */
@interface LXNetWorkHelper : NSObject
/**
 *  get请求
 */
+ (void)getWithUrlString:(NSString *)url parameters:(NSDictionary *)parameters success:(LXSuccessBlock)successBlock failure:(LXFailureBlock)failureBlock;

/**
 * post请求
 */
+ (void)postWithUrlString:(NSString *)url parameters:(NSDictionary *)parameters success:(LXSuccessBlock)successBlock failure:(LXFailureBlock)failureBlock;

@end
