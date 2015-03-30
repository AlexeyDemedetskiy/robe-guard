//
//  RBGTagListCollectionViewCell.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBGTagListCollectionCellViewModel;
@interface RBGTagListCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) RBGTagListCollectionCellViewModel* viewModel;

@end
