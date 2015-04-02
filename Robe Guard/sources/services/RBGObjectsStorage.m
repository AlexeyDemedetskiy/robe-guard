//
//  RBGObjectsStorage.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGObjectsStorage.h"

#import "RBGObject.h"

@interface RBGObjectsStorage ()

@property NSMutableSet* objects;

@end

@implementation RBGObjectsStorage

- (instancetype)init
{
    self = [super init];
    if (self == nil) return nil;
    
    _objects = [NSMutableSet new];
    
    return self;
}

- (void)addObject:(RBGObject *)anObject
{
    NSParameterAssert(anObject != nil);
    NSParameterAssert(anObject.title.length > 0);
    NSAssert(![self.objects containsObject:anObject],
             @"Object you are trying to add has already been added to storage. Object: %@", anObject);
    
    [self.objects addObject:anObject];
}

- (NSSet *)allObjects
{
    return self.objects.copy;
}

@end
