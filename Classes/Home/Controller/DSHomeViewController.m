//
//  DSHomeViewController.m
//  MyWeibo
//
//  Created by cuctv-duan on 17/4/14.
//  Copyright © 2017年 duan. All rights reserved.
//

#import "DSHomeViewController.h"

@interface DSHomeViewController ()<NSURLSessionDelegate>

@end

@implementation DSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *signBtn = [[UIButton alloc]init];
    [self.view addSubview:signBtn];
    
    [signBtn setTitle:@"登陆" forState:UIControlStateNormal];
    signBtn.titleLabel.textColor = [UIColor redColor];
    signBtn.backgroundColor = [UIColor purpleColor];
    signBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [signBtn addTarget:self action:@selector(signBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)signBtnClick {
    
//    NSURLSessionConfiguration *configuration = [[NSURLSessionConfiguration alloc]init];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/data/sk/101010100.html"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@----%@",dataDict,response);
    }];
    
    [dataTask resume];
}



@end
