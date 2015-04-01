//
//  RBGTagsStorage.h
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBGTag;
@interface RBGTagsStorage : NSObject

- (void)addTag:(RBGTag*)tag;

/// Returns all registered tags
///
/// @return [RBGTag]
- (NSArray*)allTags;

@end
