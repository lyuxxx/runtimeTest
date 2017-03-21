//
//  TestClass.m
//  test
//
//  Created by appteam on 2017/3/15.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import "TestClass.h"
#import "RuntimeKit.h"

@interface SecondClass : NSObject
- (void)onThisMethod:(NSString *)value;
@end
@implementation SecondClass

- (void)onThisMethod:(NSString *)value {
    NSLog(@"SecondClass中的方法实现%@",value);
}

@end

@interface TestClass () {
    NSInteger _var1;
    int _var2;
    BOOL _var3;
    double _var4;
    float _var5;
}
@property (nonatomic, strong) NSMutableArray *privateProperty1;
@property (nonatomic, strong) NSNumber *privateProperty2;
@property (nonatomic, strong) NSDictionary *privateProperty3;

@end

@implementation TestClass

+ (void)classMethod:(NSString *)value {
    NSLog(@"publicTestClassMethod1");
}

- (void)publicTestMethod1:(NSString *)value Second:(NSString *)value2 {
    NSLog(@"publicTestMethod1");
}

- (void)publicTestMethod2 {
    NSLog(@"publicTestMethod2");
}

- (void)privateTestMethod1 {
    NSLog(@"privateTestMethod1");
}

- (void)privateTestMethod2 {
    NSLog(@"privateTestMethod2");
}

#pragma mark - swizzle

- (void)method1 {
    NSLog(@"method1 implementation");
}

- (void)dynamicAddMethod:(NSString *)value {
    NSLog(@"oc swizzle %@",value);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    return NO;
    [RuntimeKit addMethod:[self class] method:sel method:@selector(dynamicAddMethod:)];
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [SecondClass new];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SecondClass *forwardClass = [SecondClass new];
    SEL sel = anInvocation.selector;
    if ([forwardClass respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:forwardClass];
    } else {
        [self doesNotRecognizeSelector:sel];
    }
}

- (void)testMethod {
    NSLog(@"我是TestMethod的执行结果");
}

@end
