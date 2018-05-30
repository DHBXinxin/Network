//
//  CustomMethod.h
//  YIYingWang
//
//  Created by 刘永伟 on 15/7/14.
//  Copyright (c) 2015年 刘永伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomMethod : NSObject 

+(instancetype)shareMethod;
//检测是不是登陆了已经
- (BOOL)checkIfLogin;
//制作颜色图片
- (UIImage *)getImageWithColor:(UIColor *)color;
//动画
- (CATransition *)fadeleftWithTime:(CGFloat)time;
- (CATransition *)faderightWithTime:(CGFloat)time;
- (CATransition *)pushupWithTime:(CGFloat)time;
- (CATransition *)pushdownWithTime:(CGFloat)time;

//获取文字在font下的size｜默认rect为screen｜其他情况等遇到再说
- (CGSize)labelSizeWithString:(NSString *)string andFont:(UIFont *)font;
//创建一个request
- (NSURLRequest *)request:(NSString *)urlString WithParameter:(NSDictionary *)dictionary;

@end
