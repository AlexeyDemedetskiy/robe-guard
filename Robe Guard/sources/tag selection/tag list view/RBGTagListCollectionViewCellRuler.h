//
//  RBGTagListCollectionViewCellRuler.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

@import UIKit;

@class RBGTagListCollectionCellViewModel;
@interface RBGTagListCollectionViewCellRuler : NSObject

+ (instancetype)newWithMetricCellNib:(UINib*)cellNib;

- (CGSize)defaultCellSize;
- (CGSize)cellSizeForViewModel:(RBGTagListCollectionCellViewModel*)viewModel;

@end
