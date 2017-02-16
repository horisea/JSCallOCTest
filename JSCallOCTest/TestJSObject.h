//
//  TestJSObject.h
//  JSCallOCTest
//
//  Created by 9188 on 16/8/9.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TestJSObjectProtocol <JSExport>
/// 调支付
- (void)ZTHpay;
/// 调系统相册
- (void)ZTHShowPicker;
/// 传参数回来  比如是一个订单号
- (void)ZTHPassParameter:(NSString *)orderNumber;
/// 传两个参数回来  比如是订单号，姓名
- (void)ZTHTestParameterone:(NSString *)orderNumber AndParametertwo:(NSString *)name;
@end

@interface TestJSObject : NSObject<TestJSObjectProtocol>

/// 定义三种block，回调到控制器中；
@property (nonatomic, copy) void(^showPickerBlock)();

@end
