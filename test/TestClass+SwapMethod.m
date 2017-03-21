//
//  TestClass+SwapMethod.m
//  test
//
//  Created by appteam on 2017/3/15.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import "TestClass+SwapMethod.h"
#import "RuntimeKit.h"

@implementation TestClass (SwapMethod)
- (void)swapMethod {
    [RuntimeKit methodSwap:[self class] firstMethod:@selector(method1) secondMethod:@selector(method2)];
}
- (void)method2 {
    [self method2];
    NSLog(@"可以在Method1的基础上添加各种东西");
}
@end
