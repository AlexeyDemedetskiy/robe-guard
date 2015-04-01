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

@property RBGTag* testObject;

@end

@implementation RBGTagTests

- (void)setUp {
    [super setUp];
    
    @autoreleasepool {
        self.testObject = [RBGTag newTagWithTitle:@"iOS"];
    }
}

- (void)tearDown {
    self.testObject = nil;
    
    [super tearDown];
}

- (void)testInitialization {
    XCTAssertEqualObjects(self.testObject.title, @"iOS");
}

- (void)testIdentity
{
    XCTAssertThrows([self.testObject isEqual:nil]);
    XCTAssertThrows([self.testObject isEqualToTag:nil]);
    
    XCTAssertEqualObjects(self.testObject, [RBGTag newTagWithTitle:@"iOS"]);
    XCTAssertFalse([self.testObject isEqualToTag:[RBGTag newTagWithTitle:@"Android"]]);
    XCTAssertTrue([self.testObject isEqualToTag:[RBGTag newTagWithTitle:@"iOS"]]);
    
    XCTAssertFalse(self.testObject.hash == [RBGTag newTagWithTitle:@"Android"].hash);
    XCTAssertTrue(self.testObject.hash == [RBGTag newTagWithTitle:@"iOS"].hash);
}

@end
