//
//  RBGTagListCollectionViewLayout.h
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBGTagListCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, readonly) CGFloat maximumWidth;

@property (nonatomic, readonly) NSString* inputViewKind;
@property (nonatomic, assign) CGFloat minimumInputWidth;

@end
