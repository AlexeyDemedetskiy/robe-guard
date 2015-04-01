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
    XCTAssertEqualObjects(<#expression1#>, <#expression2, ...#>)
    
    XCTAssertEqualObjects(self.testObject, [RBGTag newTagWithTitle:@"iOS"]);
    XCTAssertFalse([self.testObject isEqualToTag:[RBGTag newTagWithTitle:@"Android"]]);
    XCTAssertTrue([self.testObject isEqualToTag:[RBGTag newTagWithTitle:@"iOS"]]);
}

@end
