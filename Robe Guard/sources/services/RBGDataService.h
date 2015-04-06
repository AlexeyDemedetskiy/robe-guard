//
//  RBGDataService.h
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/2/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBGObjectUpdateContext, RBGObject;
@interface RBGDataService : NSObject

- (NSSet*)allTags;
- (NSSet*)allObjects;

- (RBGObjectUpdateContext*)makeUpdateContextForObject:(RBGObject*)object;

@end
