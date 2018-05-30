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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
//9之前
- (void)demo1 {
    NSString *url = @"http://192.168.1.1";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"username" forKey:@"user"];
    NSURLRequest *request = [[CustomMethod shareMethod]request:url WithParameter:params];
    LXConnection *connection = [[LXConnection alloc]initWithRequest:request];
    connection.completionHandler = ^(NSData *data) {
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",info);
    };
    connection.failureHandler = ^(NSError *error) {
        NSLog(@"%@",error);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
