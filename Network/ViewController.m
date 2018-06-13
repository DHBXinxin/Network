//
//  ViewController.m
//  Network
//
//  Created by DHSD on 2018/5/30.
//  Copyright © 2018年 DHSD. All rights reserved.
//

#import "ViewController.h"
#import "CustomMethod.h"
#import "LXConnection.h"
#import "LXNetWorkHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self demo1];
    
//    [self demo2];
    
//    [self demo3];
}
//9之前
- (void)demo1 {
    /*
    NSString *url = @"http://10.253.1.230:8080/DAServer/DAServlet";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"100" forKey:@"dcs"];
    [params setObject:@"atmosphere" forKey:@"method"];
    NSURLRequest *request = [[CustomMethod shareMethod]request:url WithParameter:params];
    LXConnection *connection = [[LXConnection alloc]initWithRequest:request];
    connection.completionHandler = ^(NSData *data) {
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",info);
    };
    connection.failureHandler = ^(NSError *error) {
        NSLog(@"%@",error);
    };
     */
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"100" forKey:@"dcs"];
    [params setObject:@"atmosphere" forKey:@"method"];
    [LXNetWorkHelper postWithUrlString:@"http://10.253.1.230:8080/DAServer/DAServlet" parameters:params success:^(id data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)demo2 {
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"网络响应：response：%@",response);

        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        //实例化一个客户端浏览器
        UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
        
        //加载html字符串：baseURL：基准的地址：相对路径/绝对路径
        [web loadHTMLString:html baseURL:nil];
        
        [self.view addSubview:web];
        NSLog(@"网路链接错误 connectionError响应：response：%@",connectionError);

    }];
}
- (void)demo3 {
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"网络响应：response：%@",response);
        
        //根据返回的二进制数据，生成字符串！NSUTF8StringEncoding：编码方式
        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
            
            [web loadHTMLString:html baseURL:nil];
            
            [self.view addSubview:web];
        });
        
    } ];
    [task resume];//启动task
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
