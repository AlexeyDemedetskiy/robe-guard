//
//  RBGTagSelectionModel.h
//  Robe Guard
//
//  Created by Alexey Demedckiy on 01.04.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBGTagModel : NSObject

+ (instancetype)newWithText:(NSString*)text;

@property (nonatomic, readonly) NSString* te@endxt;



@interface RBGTagSelectionModel : NSObject

+ (instancetype)newTestingModel;

@property (nonatomic, readonly) NSArray* availableTags;
@property (nonatomic, readonly) NSArray* appliedTags;

- (void)addTag:(RBGTagModel*)tag;
- (void)removeTag:(RBGTagModel*)tag;

@end
