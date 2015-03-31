//
//  RBGTagListCollectionViewLayout.m
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewLayout.h"

@implementation RBGTagListCollectionViewLayout

- (void)awakeFromNib
{
    /* Hack row alignment options */ {
        NSMutableDictionary* rowOptions = [[self valueForKey:@"_rowAlignmentsOptionsDictionary"]
                                           mutableCopy];
        rowOptions[@"UIFlowLayoutCommonRowHorizontalAlignmentKey"] = @0; // Align left options.
        [self setValue:rowOptions.copy forKey:@"_rowAlignmentsOptionsDictionary"];
    }
}

- (void)prepareLayout
{
    _maximumWidth = (self.collectionView.bounds.size.width -
                     self.sectionInset.left -
                     self.sectionInset.right);
    
    [super prepareLayout];
}

@end
