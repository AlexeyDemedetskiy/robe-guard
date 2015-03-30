//
//  RBGTagListCollectionViewModel.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewModel.h"

#import "NSObject+RBGUpdateState.h"
#import "NSNumber+RBGDoAction.h"

@interface RBGTagListCollectionViewModel ()

+ (instancetype)newWithTags:(NSArray*)tags;

@property (nonatomic, strong) NSArray* tags;

@end

@interface RBGTagListCollectionCellViewModel ()

+ (instancetype)newWithText:(NSString*)text;

@property (nonatomic, strong) NSString* text;

@end



@implementation RBGTagListCollectionViewModel

+ (instancetype)newWithTags:(NSArray *)tags
{
    return [self rbg_newWithState:^(RBGTagListCollectionViewModel* vm) {
        vm.tags = tags;
    }];
}

+ (instancetype)newWithTags:(NSArray *)tags shuffledUpTo:(NSUInteger)count
{
    return [self newWithTags:
            [@(count) rbg_yield:
             ^id(NSUInteger step) {
                 return tags.count == 0 ? nil : tags[arc4random_uniform((u_int32_t)tags.count)];
             }]];
}

+ (instancetype)newTestingViewModel
{
    return [self newWithTags:
            @[[RBGTagListCollectionCellViewModel newWithText:@"Example"],
              [RBGTagListCollectionCellViewModel newWithText:@"Another example"],
              [RBGTagListCollectionCellViewModel newWithText:@"Some long text that cannot be written in one screen definetely"],
              ]
            shuffledUpTo:30];
}

@end

@implementation RBGTagListCollectionCellViewModel

+ (instancetype)newWithText:(NSString *)text
{
    return [self rbg_newWithState:^(RBGTagListCollectionCellViewModel* vm) {
        vm.text = text;
    }];
}

@end
