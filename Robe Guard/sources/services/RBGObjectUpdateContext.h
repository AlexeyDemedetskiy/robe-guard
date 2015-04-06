//
//  RBGDataUpdateContext.h
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/2/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBGTag;
@interface RBGObjectUpdateContext : NSObject

- (void)addTag:(RBGTag*)tag;
- (void)removeTag:(RBGTag*)tag;
- (void)save:(NSError**)error;

@end
