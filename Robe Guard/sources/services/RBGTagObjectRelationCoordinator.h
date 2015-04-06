//
//  RBGTagObjectRelationCoordinator.h
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBGTag, RBGObject;
@interface RBGTagObjectRelationCoordinator : NSObject

- (void)addRelationForTag:(RBGTag*)tag object:(RBGObject*)object;
- (void)removeRelationForTag:(RBGTag*)tag object:(RBGObject*)object;

/**
 *  Get all tags associated with given object
 *
 *  @param object: RBGObject - entity representing data
 *
 *  @return NSSet of tags: RBGTag
 */
- (NSSet*)tagsForObject:(RBGObject*)object;

/**
 *  Get all objects associated with given tag
 *
 *  @param tag: RBGTag - entity representing given object metadata
 *
 *  @return NSSet of objects: RBGObject
 */
- (NSSet*)objectsForTag:(RBGTag*)tag;

@end
