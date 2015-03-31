//
//  RBGTagListCollectionViewController.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBGTagListCollectionViewModel;
@interface RBGTagListCollectionViewController : UICollectionViewController

@property (nonatomic, strong) RBGTagListCollectionViewModel* viewModel;

@end
