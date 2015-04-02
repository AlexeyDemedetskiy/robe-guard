//
//  RBGObjectTests.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/2/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RBGObject.h"

@interface RBGObjectTests : XCTestCase

@end

@implementation RBGObjectTests

- (void)testCreation {
    XCTAssertThrows([RBGObject newObjectWithTitle:nil]);
    XCTAssertEqualObjects([RBGObject newObjectWithTitle:@"iOS Article"].title, @"iOS Article");
}

- (void)testIdentity
{
    XCTAssertNotEqualObjects([RBGObject newObjectWithTitle:@"iOS Article"],
                             [RBGObject newObjectWithTitle:@"Android Article"]);
    XCTAssertEqualObjects([RBGObject newObjectWithTitle:@"iOS Article"],
                          [RBGObject newObjectWithTitle:@"iOS Article"]);
}

@end
