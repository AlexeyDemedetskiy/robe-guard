//
//  RBGTag.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTag.h"
#import "NSObject+RBGUpdateState.h"

@interface RBGTag ()

@property (readwrite) NSString* title;

@end

@implementation RBGTag

+ (instancetype)newTagWithTitle:(NSString*)title
{
    return [self rbg_newWithState:^(RBGTag* tag) {
        tag.title = title;
    }];
}

- (BOOL)isEqual:(id)object
{
    NSParameterAssert(object != nil);
    
    return ([object isKindOfClass:[self class]] && [self isEqualToTag:object]);
}

- (BOOL)isEqualToTag:(RBGTag*)tag
{
    NSParameterAssert(tag != nil);
    
    return [tag.title isEqualToString:self.title];
}

- (NSUInteger)hash
{
    return self.title.hash;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@" Tag title: \"%@\"", self.title];
}

@end
