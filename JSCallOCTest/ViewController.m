//
//  ViewController.m
//  JSCallOCTest
//
//  Created by 9188 on 16/8/9.
//  Copyright © 2016年 朱同海. All rights reserved.
//  本文主要介绍JS调用OC交互的方式

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TestJSObject.h"

@interface ViewController () <UIWebViewDelegate, UIActionSheetDelegate>
{
    JSContext *_context;
}
@property (nonatomic, strong) UIWebView *webview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.webview];
}
#pragma mark - lazy
- (UIWebView *)webview{
    if (!_webview) {
        _webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 300)];
        _webview.delegate = self;
        _webview.backgroundColor=[UIColor lightGrayColor];
        NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSURL *localUrl = [[NSURL alloc] initFileURLWithPath:htmlPath];
        [_webview loadRequest:[NSURLRequest requestWithURL:localUrl]];
    }
    return _webview;
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
   _context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 testobject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
    TestJSObject *testJO=[TestJSObject new];
    testJO.showPickerBlock = ^{
        [self showImagePicker];
    };
    _context[@"testobject"]=testJO;
}
- (void)showImagePicker{
    NSLog(@"开始唤起相机");
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"请选择文件来源"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"从手机相册选择",nil];
    [actionSheet showInView:self.view];
}
@end
