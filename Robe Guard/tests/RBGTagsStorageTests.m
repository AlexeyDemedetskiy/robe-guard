//
//  RBGRagsStorageTests.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RBGTagsStorage.h"
#import "RBGTag.h"

@interface RBGTagsStorageTests : XCTestCase

@property RBGTagsStorage* testObject;

@end

@implementation RBGTagsStorageTests

- (void)setUp
{
    [super setUp];
    
    @autoreleasepool {
        self.testObject = [RBGTagsStorage new];
    }
}

- (void)tearDown
{
    self.testObject = nil;
    
    [super tearDown];
}

- (void)testInitialization
{
    XCTAssertEqualObjects(self.testObject.allTags, @[]);
}

- (void)testAddTag
{
    XCTAssertThrows([self.testObject addTag:nil]);
    
    RBGTag* tag = [RBGTag newTagWithTitle:@"iOS"];
    [self.testObject addTag:tag];
    XCTAssertEqualObjects(self.testObject.allTags, @[tag]);
    XCTAssertThrows([self.testObject addTag:tag]);
    XCTAssertThrows([self.testObject addTag:nil]);
}

- (void)testAllTags
{
    RBGTag* tag = [RBGTag newTagWithTitle:@"iOS"];
    [self.testObject addTag:tag];
    XCTAssertEqualObjects(self.testObject.allTags, @[tag]);
    
    RBGTag* tag1 = [RBGTag newTagWithTitle:@"OS X"];
    [self.testObject addTag:tag1];
    NSArray* tags = @[tag, tag1];
    XCTAssertEqualObjects(self.testObject.allTags, tags);
}

@end
