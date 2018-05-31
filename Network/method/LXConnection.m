//
//  LXConnection.m
//  YiYingWang
//
//  Created by 刘永伟 on 15/8/7.
//  Copyright (c) 2015年 刘永伟. All rights reserved.
//

#import "LXConnection.h"

@interface LXConnection ()

@end

@implementation LXConnection
- (instancetype)initWithRequest:(NSURLRequest *)request {
    self = [super initWithRequest:request delegate:self];
    if (self) {
        
    }
    return self;
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"response:\n%@", [res allHeaderFields]);
    receiveData = [NSMutableData data];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receiveData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if (self.completionHandler) {
        self.completionHandler(receiveData);
    }
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (self.failureHandler) {
        self.failureHandler(error);
    }
}
@end
