//
//  RBGTagTests.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RBGTag.h"

@interface RBGTagTests : XCTestCase

@end

@implementation RBGTagTests

- (void)testCreation {
    XCTAssertThrows([RBGTag newTagWithTitle:nil]);
    XCTAssertThrows([RBGTag newTagWithTitle:@""]);
    XCTAssertEqualObjects([RBGTag newTagWithTitle:@"iOS"].title, @"iOS");
}

- (void)testIdentity
{
    XCTAssertNotEqualObjects([RBGTag newTagWithTitle:@"iOS"], [RBGTag newTagWithTitle:@"Android"]);
    XCTAssertEqualObjects([RBGTag newTagWithTitle:@"iOS"], [RBGTag newTagWithTitle:@"iOS"]);
}

@end
