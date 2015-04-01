//
//  RBGObjectsStorage.h
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBGObject;
@interface RBGObjectsStorage : NSObject

- (void)addObject:(RBGObject*)anObject;
- (void)removeObject:(RBGObject*)anObject;

/// Returns all registered objects
///
/// @return [RBGObject]
- (NSArray*)allObjects;

@end
