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

@end

@implementation RBGTagsStorageTests

- (void)testTagsManagement
{
    RBGTagsStorage* testObject = [RBGTagsStorage new];
    
    NSMutableSet* tags = [NSMutableSet new];
    
    XCTAssertEqualObjects(testObject.allTags, tags);
    XCTAssertThrows([testObject addTag:nil]);
    XCTAssertThrows([testObject addTag:[RBGTag newTagWithTitle:@""]]);
    
    RBGTag* tag = [RBGTag newTagWithTitle:@"iOS"];
    [testObject addTag:tag];
    [tags addObject:tag];
    
    XCTAssertEqualObjects(testObject.allTags, tags);
    XCTAssertThrows([testObject addTag:tag]);
    
    RBGTag* tag1 = [RBGTag newTagWithTitle:@"OS X"];
    [testObject addTag:tag1];
    [tags addObject:tag1];
    
    XCTAssertEqualObjects(testObject.allTags, tags);
}

@end
