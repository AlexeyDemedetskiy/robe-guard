//
//  RBGTagObjectRelationCoordinatorTests.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/2/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RBGTagObjectRelationCoordinator.h"
#import "RBGTag.h"
#import "RBGObject.h"

@interface RBGTagObjectRelationCoordinatorTests : XCTestCase

@end

@implementation RBGTagObjectRelationCoordinatorTests

- (void)testRelationsManagement
{
    RBGTagObjectRelationCoordinator* testObject = [RBGTagObjectRelationCoordinator new];
    
    XCTAssertThrows([testObject addRelationForTag:nil object:nil]);
    XCTAssertThrows([testObject removeRelationForTag:nil object:nil]);
    XCTAssertThrows([testObject objectsForTag:nil]);
    XCTAssertThrows([testObject tagsForObject:nil]);
    
    RBGTag* tag1 = [RBGTag newTagWithTitle:@"iOS"];
    RBGObject* obj1 = [RBGObject newObjectWithTitle:@"iOS Article"];
    
    XCTAssertThrows([testObject addRelationForTag:nil object:obj1]);
    XCTAssertThrows([testObject addRelationForTag:tag1 object:nil]);
    
    NSMutableSet* objSet = [NSMutableSet new];
    NSMutableSet* tagSet = [NSMutableSet new];
    
    XCTAssertEqualObjects([testObject tagsForObject:obj1], tagSet);
    XCTAssertEqualObjects([testObject objectsForTag:tag1], objSet);
    
    [testObject addRelationForTag:tag1 object:obj1];
    [objSet addObject:obj1];
    [tagSet addObject:tag1];
    
    XCTAssertEqualObjects([testObject tagsForObject:obj1], tagSet);
    XCTAssertEqualObjects([testObject objectsForTag:tag1], objSet);
    
    XCTAssertThrows([testObject addRelationForTag:tag1 object:obj1]);
    
    [testObject removeRelationForTag:tag1 object:obj1];
    
    XCTAssertNotEqualObjects([testObject tagsForObject:obj1], tagSet);
    XCTAssertNotEqualObjects([testObject objectsForTag:tag1], objSet);
    
    XCTAssertEqualObjects([testObject tagsForObject:obj1], [NSSet new]);
    XCTAssertEqualObjects([testObject objectsForTag:tag1], [NSSet new]);
    
    XCTAssertThrows([testObject removeRelationForTag:tag1 object:obj1]);
}

@end
