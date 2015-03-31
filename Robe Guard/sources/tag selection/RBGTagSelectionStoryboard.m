//
//  RBGTagSelectionStoryboard.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagSelectionStoryboard.h"

const struct RBGTagSelectionStoryboardIDs RBGTagSelectionStoryboardIDs = {
    .name = @"RBGTagSelectionStoryboard",
    .controllers = {
        .tagList = @"tag list collection view",
    },
    .cells = {
        .tagListCell = @"com.robe-guard.tag-list.cell",
    },
};

@implementation RBGTagSelectionStoryboard

+ (instancetype)new
{
    return (RBGTagSelectionStoryboard*)[super
                                        storyboardWithName:self.IDs.name
                                        bundle:[NSBundle bundleForClass:[self class]]];
}

+ (struct RBGTagSelectionStoryboardIDs)IDs
{
    return RBGTagSelectionStoryboardIDs;
}

- (struct RBGTagSelectionStoryboardIDs)IDs
{
    return [RBGTagSelectionStoryboard IDs];
}

- (RBGTagListCollectionViewController*)instantiateTagListViewController;
{
    return [self instantiateViewControllerWithIdentifier:self.IDs.controllers.tagList];
}

@end

@implementation UIViewController (RBGTagSelectionStoryboard)

- (RBGTagSelectionStoryboard *)rbg_tagSelectionStoryboard
{
    id sb = self.storyboard;
    if ([sb isKindOfClass:[RBGTagSelectionStoryboard class]]) {
        return sb;
    }
    
    return nil;
}

@end
