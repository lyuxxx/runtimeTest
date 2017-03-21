//
//  ViewController.m
//  test
//
//  Created by appteam on 2017/3/13.
//  Copyright © 2017年 colin.liu. All rights reserved.
//
//http://www.cnblogs.com/ludashi/p/6294112.html

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "TestClass+Logging.h"

#define SREENWIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestClass *testClass = [[TestClass alloc] init];
    [testClass testMethod];
}


@end
