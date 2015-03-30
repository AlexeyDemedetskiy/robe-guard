//
//  NSObject+RBGUpdateState.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "NSObject+RBGUpdateState.h"

@implementation NSObject (RBGUpdateState)

+ (instancetype)rbg_newWithState:(void (^)(id))stateBlock
{
    return [[self new] rbg_update:stateBlock];
}

- (instancetype)rbg_update:(void (^)(id))updateBlock
{
    if (updateBlock != nil) updateBlock(self);
    
    return self;
}

@end
