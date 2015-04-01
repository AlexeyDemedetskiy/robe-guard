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
    @autoreleasepool {
        self.testObject = [RBGTagsStorage new];
    }
}

- (void)tearDown
{
    self.testObject = nil;
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

- (void)testRemoveTag
{
    XCTAssertThrows([self.testObject removeTag:nil]);
    
    RBGTag* tag = [RBGTag newTagWithTitle:@"iOS"];
    [self.testObject addTag:tag];
    [self.testObject removeTag:tag];
    XCTAssertEqualObjects(self.testObject.allTags, @[]);
    XCTAssertThrows([self.testObject removeTag:tag]);
    XCTAssertThrows([self.testObject removeTag:nil]);
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
