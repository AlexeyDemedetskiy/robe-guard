//
//  RBGTagListCollectionViewModel.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RBGTagListCollectionCellViewModel;
@interface RBGTagListCollectionViewModel : NSObject

@property (nonatomic, readonly) NSArray* availablTags;
@property (nonatomic, readonly) NSArray* selectedTags;

- (void)selectTagViewModel:(RBGTagListCollectionCellViewModel*)viewModel;

@end

@interface RBGTagListCollectionCellViewModel : NSObject

@property (nonatomic, readonly) NSString* text;

@end
