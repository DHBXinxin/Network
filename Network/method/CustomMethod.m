//
//  CustomMethod.m
//  YIYingWang
//
//  Created by 刘永伟 on 15/7/14.
//  Copyright (c) 2015年 刘永伟. All rights reserved.
//

#import "CustomMethod.h"

@implementation CustomMethod

static CustomMethod *customMethod = nil;

+(instancetype)shareMethod {
    if (customMethod == nil) {
        customMethod = [[CustomMethod alloc]init];
    }
    return customMethod;
}

- (UIImage *)getImageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContext(CGSizeMake(44, 44));
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    view.backgroundColor = color;
//    [self.window addSubview:view];
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    [view removeFromSuperview];
    view = nil;
    context = nil;
    return image;
}
//    [UIView animateWithDuration:1.0 animations:^{
//        self.navigationItem.leftBarButtonItem = nil;
//        self.navigationItem.rightBarButtonItem = nil;
//        self.navigationItem.rightBarButtonItem = self.cancelItem;
//    } completion:^(BOOL finished) {
//
//    }];
//    [UIView beginAnimations:@"animation" context:nil];
//    [UIView setAnimationDuration:1.0f];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.navigationController.navigationBar cache:YES];
//    [UIView commitAnimations];//不合适
/*CATransition的私有动画类型
animation.type = @"cube"
animation.type = @"suckEffect";
animation.type = @"oglFlip";//不管subType is "fromLeft" or "fromRight",official只有一种效果
animation.type = @"rippleEffect";
animation.type = @"pageCurl";
animation.type = @"pageUnCurl"
animation.type = @"cameraIrisHollowOpen ";
animation.type = @"cameraIrisHollowClose ";
*/
- (CATransition *)fadeleftWithTime:(CGFloat)time {
    CATransition *animation = [CATransition animation];
    animation.duration = time;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromLeft;
    return animation;
}
- (CATransition *)faderightWithTime:(CGFloat)time {
    CATransition *animation = [CATransition animation];
    animation.duration = time;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromRight;
    return animation;
}
- (CATransition *)pushupWithTime:(CGFloat)time {
    CATransition *animation = [CATransition animation];
    animation.duration = time;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    return animation;
}
- (CATransition *)pushdownWithTime:(CGFloat)time {
    CATransition *animation = [CATransition animation];
    animation.duration = time;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    return animation;
}
- (CGSize)labelSizeWithString:(NSString *)string andFont:(UIFont *)font {

    CGSize stringSize;
    CGSize size = CGSizeZero;//CGSizeMake(SCREEN_WIDTH, MAXFLOAT);
    NSRange range = NSMakeRange(0, string.length);
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    [attribute addAttribute:NSParagraphStyleAttributeName value:style range:range];
    [attribute addAttribute:NSFontAttributeName value:font range:range];
    NSDictionary *attDic = [attribute attributesAtIndex:0 effectiveRange:&range];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
//        获取动态的宽度为
//        stringSize = [string sizeWithAttributes:@{NSFontAttributeName: font}];
//        动态获取高度
        stringSize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attDic context:nil].size;
    } else {
#pragma clang diagnostic push
        
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//        获取动态的宽度为
//        stringSize = [string sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
//        动态获取高度
        stringSize = [string sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
#pragma clang diagnostic pop
    }
    return stringSize;
}

- (NSURLRequest *)request:(NSString *)urlString WithParameter:(NSDictionary *)dictionary {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url
                                                               cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:10];
    NSMutableData *postData = [NSMutableData data];
    if (dictionary != nil) {
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        NSArray *keys = [dictionary allKeys];
        NSInteger count = keys.count - 1;
        for (NSInteger i = 0; i < keys.count; i++) {
            NSString *key = [keys objectAtIndex:i];
            NSString *string = [NSString stringWithFormat:@"%@=%@%@",key, [dictionary objectForKey:key], (i < count ? @"&" : @"")];
            NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
            [postData appendData:data];
        }
        NSString *postLength = [NSString stringWithFormat:@"%li", [postData length]];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:postData];
    } else {
        [request setHTTPMethod:@"GET"];
    }
    return request;
}
@end
