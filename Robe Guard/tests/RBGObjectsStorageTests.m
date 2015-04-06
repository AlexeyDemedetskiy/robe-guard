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

@end

@implementation RBGObjectsStorageTests

- (void)testObjectsManagament
{
    RBGObjectsStorage* testObject = [RBGObjectsStorage new];
    
    NSMutableSet* objs = [NSMutableSet new];
    
    XCTAssertEqualObjects(testObject.allObjects, objs);
    XCTAssertThrows([testObject addObject:nil]);
    XCTAssertThrows([testObject addObject:[RBGObject newObjectWithTitle:nil]]);
    
    RBGObject* obj1 = [RBGObject newObjectWithTitle:@"iOS Article"];
    [testObject addObject:obj1];
    [objs addObject:obj1];
    
    XCTAssertEqualObjects([testObject allObjects], objs);
    XCTAssertThrows([testObject addObject:obj1]);
    
    RBGObject* obj2 = [RBGObject newObjectWithTitle:@"Math Article"];
    [testObject addObject:obj2];
    [objs addObject:obj2];
    
    XCTAssertEqualObjects(testObject.allObjects, objs);
    
}

@end
