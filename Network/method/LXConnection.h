//
//  LXConnection.h
//  YiYingWang
//
//  Created by 刘永伟 on 15/8/7.
//  Copyright (c) 2015年 刘永伟. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 9之前的方法
 */
@interface LXConnection : NSURLConnection<NSURLConnectionDataDelegate, NSURLConnectionDelegate> {
    NSMutableData *receiveData;
}
/**
 *  完成获取的data
 */
@property (copy, nonatomic) void (^completionHandler)(NSData *);
/**
 *  失败
 */
@property (copy, nonatomic) void (^failureHandler)(NSError *error);

- (instancetype)initWithRequest:(NSURLRequest *)request;

@end
