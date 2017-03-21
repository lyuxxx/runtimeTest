//
//  RuntimeKit.h
//  test
//
//  Created by appteam on 2017/3/15.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface RuntimeKit : NSObject

+ (NSString *)fetchClassName:(Class)class;
+ (NSArray *)fetchIvarList:(Class)class;
+ (NSArray *)fetchPropertyList:(Class)class;
+ (NSArray *)fetchMethodList:(Class)class;
+ (NSArray *)fetchProtocolList:(Class)class;
+ (void)addMethod:(Class)class method:(SEL)methodSel method:(SEL)methodSelImpl;
+ (void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2;

@end
