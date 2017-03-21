//
//  TestClass+AssociatedObject.h
//  test
//
//  Created by appteam on 2017/3/15.
//  Copyright © 2017年 colin.liu. All rights reserved.
//

#import "TestClass.h"
#import "RuntimeKit.h"

@interface TestClass (AssociatedObject)
@property (nonatomic, strong) NSString *dynamicAddProperty;
@end
