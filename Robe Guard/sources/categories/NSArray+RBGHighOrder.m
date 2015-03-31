//
//  NSArray+RBGHighOrder.m
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "NSArray+RBGHighOrder.h"

@implementation NSArray (RBGHighOrder)

- (NSArray *)rbg_map:(id (^)(id))mapBlock
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        [result addObject:mapBlock(object) ?: [NSNull null]];
    }
    
    return result.copy;
}

@end
