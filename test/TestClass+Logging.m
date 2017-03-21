//
//  TestClass+Logging.m
//  test
//
//  Created by appteam on 2017/3/15.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import "TestClass+Logging.h"

@implementation TestClass (Logging)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(testMethod) withMethod:@selector(logTestMethod)];
    });
}

- (void)logTestMethod {
    [self before];
    [self logTestMethod];
    [self after];
}

- (void)before {
    NSLog(@"before");
}

- (void)after {
    NSLog(@"after");
}

- (void)swizzleMethod:(SEL)originSEL withMethod:(SEL)newSEL {
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@end
