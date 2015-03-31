//
//  RBGTagListCollectionViewModel.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RBGTagListCollectionViewModel : NSObject

+ (instancetype)newTestingViewModel;

@property (nonatomic, readonly) NSArray* tags;

@end

@interface RBGTagListCollectionCellViewModel : NSObject

@property (nonatomic, readonly) NSString* text;

@end
