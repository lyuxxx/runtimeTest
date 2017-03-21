//
//  TestClass.h
//  test
//
//  Created by appteam on 2017/3/15.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject<NSCoding, NSCopying>
@property (nonatomic, strong) NSArray *publicProperty1;
@property (nonatomic, strong) NSString *publicProperty2;

+ (void)classMethod:(NSString *)value;
- (void)publicTestMethod1:(NSString *)value Second:(NSString *)value2;
- (void)publicTestMethod2;

- (void)method1;

- (void)testMethod;
@end
