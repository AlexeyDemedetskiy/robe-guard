//
//  RBGTagObjectRelationCoordinator.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagObjectRelationCoordinator.h"

#import "NSObject+RBGUpdateState.h"
#import "RBGTag.h"
#import "RBGObject.h"

@interface RBGTagObjectRelation : NSObject

@property RBGTag* tag;
@property RBGObject* object;

+ (instancetype)newRelationWithTag:(RBGTag*)tag object:(RBGObject*)object;

- (BOOL)isEqualToRelation:(RBGTagObjectRelation*)relation;

@end

@implementation RBGTagObjectRelation

+ (instancetype)newRelationWithTag:(RBGTag*)tag object:(RBGObject*)object
{
    return [self rbg_newWithState:^(RBGTagObjectRelation* x) {
        NSCParameterAssert(tag != nil && object != nil);
        
        x.tag = tag;
        x.object = object;
    }];
}

- (BOOL)isEqual:(id)object
{
    return ((self == object) ||
            ([object isKindOfClass:[self class]] &&
             [self isEqualToRelation:object]));
}

- (BOOL)isEqualToRelation:(RBGTagObjectRelation*)relation
{
    return ([self.tag isEqualToTag:relation.tag] &&
            [self.object isEqualToObject:relation.object]);
}

#define NSUINT_BIT (CHAR_BIT * sizeof(NSUInteger))
#define NSUINTROTATE(val, howmuch) ((((NSUInteger)val) << howmuch) | (((NSUInteger)val) >> (NSUINT_BIT - howmuch)))

- (NSUInteger)hash
{
    return NSUINTROTATE(self.tag.hash, NSUINT_BIT / 2) ^ self.object.hash;
}

#undef NSUINT_BIT
#undef NSUINTROTATE

@end



@interface RBGTagObjectRelationCoordinator ()

@property NSMutableSet* relations;

@end

@implementation RBGTagObjectRelationCoordinator

- (instancetype)init
{
    self = [super init];
    if (self == nil) return nil;
    
    _relations = [NSMutableSet new];
    
    return self;
}

- (void)addRelationForTag:(RBGTag *)tag object:(RBGObject *)object
{
    NSParameterAssert(tag != nil && object != nil);
    
    RBGTagObjectRelation* relation = [RBGTagObjectRelation newRelationWithTag:tag object:object];
    
    NSAssert(![self.relations containsObject:relation],
             @"Relation you are trying to add already exists. Relation: %@", relation);
    
    [self.relations addObject:relation];
}

- (void)removeRelationForTag:(RBGTag *)tag object:(RBGObject *)object
{
    NSParameterAssert(tag != nil && object != nil);
    
    RBGTagObjectRelation* relation = [RBGTagObjectRelation newRelationWithTag:tag object:object];
    
    NSAssert([self.relations containsObject:relation],
             @"Relation you are trying to remove doesn't exists. Relation: %@", relation);
    
    [self.relations removeObject:relation];
}

- (NSSet*)tagsForObject:(RBGObject*)object
{
    NSParameterAssert(object != nil);
    
    NSMutableSet* tags = [NSMutableSet new];
    
    for (RBGTagObjectRelation* relation in self.relations) {
        if ([relation.object isEqualToObject:object]) {
            [tags addObject:relation.tag];
        }
    }
    
    return tags.copy;
}

- (NSSet*)objectsForTag:(RBGTag*)tag
{
    NSParameterAssert(tag != nil);
    
    NSMutableSet* objects = [NSMutableSet new];
    
    for (RBGTagObjectRelation* relation in self.relations) {
        if ([relation.tag isEqualToTag:tag]) {
            [objects addObject:relation.object];
        }
    }
    
    return objects.copy;
}


@end
