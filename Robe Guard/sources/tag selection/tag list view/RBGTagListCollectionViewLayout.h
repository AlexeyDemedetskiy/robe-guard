//
//  RBGTagListCollectionViewLayout.h
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBGTagListCollectionViewLayout;
@protocol RBGTagListCollectionViewLayoutDelegate <NSObject>

- (BOOL)
layout:(RBGTagListCollectionViewLayout *)collectionViewLayout
shouldInsertInputViewAtSection:(NSUInteger)sectionIndex;

- (CGSize)
layout:(RBGTagListCollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface RBGTagListCollectionViewLayout : UICollectionViewLayout

+ (NSString*)inputViewKind;
@property (readonly) NSString* inputViewKind;

@property (weak) IBOutlet id<RBGTagListCollectionViewLayoutDelegate> delegate;

@property IBInspectable UIEdgeInsets sectionInsets;
@property IBInspectable CGFloat itemSpacing;
@property IBInspectable CGFloat lineSpacing;

@property IBInspectable CGSize minimumInputSize;

/// Contains maximum allowed element width;
@property (readonly) CGFloat maximumWidth;

@end
