//
//  RBGObjectsStorageTests.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RBGObjectsStorage.h"
#import "RBGObject.h"

@interface RBGObjectsStorageTests : XCTestCase

@property RBGObjectsStorage* testObject;

@end

@implementation RBGObjectsStorageTests

- (void)setUp {
    [super setUp];
    
    @autoreleasepool {
        self.testObject = [RBGObjectsStorage new];
    }
}

- (void)tearDown {
    self.testObject = nil;
    
    [super tearDown];
}

- (void)testInitialization
{
    XCTAssertEqualObjects(self.testObject.allObjects, @[]);
}

- (void)testAdd
{
    XCTAssertThrows([self.testObject addObject:nil]);
    
    RBGObject* obj = [RBGObject new];
    
}

- (void)testRemove
{
    
}

- (void)testAll
{
    
}

@end
