//
//  DSWViewController.m
//  MyWeibo
//
//  Created by cuctv-duan on 17/4/13.
//  Copyright © 2017年 duan. All rights reserved.
//

#import "DSWViewController.h"
#import "DSWView.h"
#import <WebKit/WebKit.h>

@interface DSWViewController ()<WKNavigationDelegate>

@end

@implementation DSWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

//    UIWebView *myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:myWebView];
//    
//    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com"]]];
    
    
    WKWebView *wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:wkWebView];
    
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com"]]];
    wkWebView.navigationDelegate = self;
}
#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    [webView evaluateJavaScript:@"showAlert('奏是一个弹框')" completionHandler:^(id item, NSError * _Nullable error) {
        // Block中处理是否通过了或者执行JS错误的代码
    }];
}


//- (void)loadView {
//    [super loadView];
////    self.view.backgroundColor = [UIColor redColor];
//    
//    DSWView *myView = [[NSBundle mainBundle]loadNibNamed:@"DSWView" owner:nil options:nil].lastObject;
//    [self.view addSubview:myView];
//    
//    myView.frame = CGRectMake(0, 0, 99, 99);
//}


//- (void)setView:(UIView *)view {
//    [super setView:view];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
