//
//  RBGTagsStorage.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagsStorage.h"
#import "NSObject+RBGUpdateState.h"
#import "RBGTag.h"


@interface RBGTagsStorage ()

@property NSMutableSet* tags;

@end

@implementation RBGTagsStorage

- (instancetype)init
{
    self = [super init];
    
    if (self == nil) return nil;
    
    _tags = [NSMutableSet new];
    
    return self;
}

- (void)addTag:(RBGTag*)tag
{
    NSParameterAssert(tag != nil);
    NSParameterAssert(tag.title.length > 0);
    NSAssert(![self.tags containsObject:tag],
             @"Tag you are trying to add has already been added to storage. Tag: %@", tag);
    
    [self.tags addObject:tag];
}

- (NSSet*)allTags
{
    return self.tags.copy;
}

@end
