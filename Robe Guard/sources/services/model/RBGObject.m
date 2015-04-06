//
//  RBGObject.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGObject.h"
#import "NSObject+RBGUpdateState.h"

@interface RBGObject ()

@property (readwrite) NSString* title;

@end

@implementation RBGObject

+ (instancetype)newObjectWithTitle:(NSString *)title
{
    return [self rbg_newWithState:^(RBGObject* obj) {
        NSCParameterAssert(title != nil);
        obj.title = title;
    }];
}

- (BOOL)isEqual:(id)object
{
    return ((self == object) ||
            ([object isKindOfClass:[self class]] &&
             [self isEqualToObject:object]));
}

- (BOOL)isEqualToObject:(RBGObject *)object
{
    return [self.title isEqualToString:object.title];
}

- (NSUInteger)hash
{
    return self.title.hash;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@" Object with title: %@", self.title];
}

@end
