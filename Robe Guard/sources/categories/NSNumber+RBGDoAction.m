//
//  NSNumber+RBGDoAction.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "NSNumber+RBGDoAction.h"

@implementation NSNumber (RBGDoAction)

- (void)rbg_do:(void (^)(NSUInteger))doBlock
{
    for (int i = 0; i < self.unsignedIntegerValue; i++) {
        doBlock(i);
    }
}

- (NSArray *)rbg_yield:(id (^)(NSUInteger))yieldBlock
{
    NSMutableArray* array = [NSMutableArray new];
    [self rbg_do:^(NSUInteger step) {
        [array addObject:yieldBlock(step) ?: [NSNull null]];
    }];
    
    return array.copy;
}

@end
