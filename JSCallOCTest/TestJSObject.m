//
//  TestJSObject.m
//  JSCallOCTest
//
//  Created by 9188 on 16/8/9.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "TestJSObject.h"

@implementation TestJSObject

- (void)ZTHpay{
    NSLog(@"调了支付了－－－－－－－－－－－－－－－－－");
}

- (void)ZTHShowPicker{
    NSLog(@"调了相机－－－－－－－－－－－－－－－－－－－");
    dispatch_async(dispatch_get_main_queue(), ^{
        // 当然回调后要处理的逻辑，肯定不能在这个类里处理，这里采用block回调到控制器中处理，其余的三种方式都可以用这种方式处理，这里就不一一列举了
        self.showPickerBlock();
    });
}

- (void)ZTHPassParameter:(NSString *)orderNumber{
    NSLog(@"%@", orderNumber);
}

//- (void)ZTHTestParameterone:(NSString *)orderNumber AndParametertwo:(NSString *)name{
//    NSLog(@"订单号－－%@姓名－－－%@", orderNumber, name);
//}

- (void)ZTHTestParameteroneAnd:(NSString *)orderNumber Parametertwo:(NSString *)name{
    NSLog(@"订单号－－%@姓名－－－%@", orderNumber, name);
}
@end
