//
//  RBGTagSelectionStoryboard.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define field(__TYPE__, __NAME__) __unsafe_unretained __TYPE__ __NAME__
#define group(__NAME__, __CODE__) struct __CODE__ __NAME__

struct RBGTagSelectionStoryboardIDs
{
    field(NSString*, name);
    group(controllers, {
        field(NSString*, tagList);
    });
    group(cells, {
        field(NSString*, tagListCell);
    });
};

#undef field
#undef group

@class RBGTagListCollectionViewController;

@interface RBGTagSelectionStoryboard : UIStoryboard

+ (instancetype)new;
+ (UIStoryboard *)storyboardWithName:(NSString *)name
                              bundle:(NSBundle *)storyboardBundleOrNil NS_UNAVAILABLE;

+ (struct RBGTagSelectionStoryboardIDs)IDs;
@property (nonatomic, readonly) struct RBGTagSelectionStoryboardIDs IDs;

- (RBGTagListCollectionViewController*)instantiateTagListViewController;

@end

@interface UIViewController (RBGTagSelectionStoryboard)

@property (nonatomic, readonly) RBGTagSelectionStoryboard* rbg_tagSelectionStoryboard;

@end