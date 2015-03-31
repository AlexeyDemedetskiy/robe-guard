//
//  RBGTagListCollectionViewLayout.m
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewLayout.h"

@implementation RBGTagListCollectionViewLayout {
    CGFloat _inputAddedHeight;
}

- (void)awakeFromNib
{
    /* Hack row alignment options */ {
        /*{
            UIFlowLayoutCommonRowHorizontalAlignmentKey = 3;
            UIFlowLayoutLastRowHorizontalAlignmentKey = 0;
            UIFlowLayoutRowVerticalAlignmentKey = 1;
        }*/
        NSMutableDictionary* rowOptions = [[self valueForKey:@"_rowAlignmentsOptionsDictionary"]
                                           mutableCopy];
        rowOptions[@"UIFlowLayoutCommonRowHorizontalAlignmentKey"] = @0; // Align left options.
        [self setValue:rowOptions.copy forKey:@"_rowAlignmentsOptionsDictionary"];
    }
    
    _inputViewKind = @"com.robe-guard.tag-selection.input";
    _minimumInputWidth = 40;
}

- (void)prepareLayout
{
    _maximumWidth = (self.collectionView.bounds.size.width -
                     self.sectionInset.left -
                     self.sectionInset.right);
    
    [super prepareLayout];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    _inputAddedHeight = 0;
    
    NSMutableArray* attributes = [super layoutAttributesForElementsInRect:rect].mutableCopy;
    for (UICollectionViewLayoutAttributes* attribute in attributes.copy) {
        /* update vertical position */ {
            CGRect attributeFrame = attribute.frame;
            attributeFrame.origin.y += _inputAddedHeight;
            attribute.frame = attributeFrame;
        }

        
        if (attribute.indexPath.row == [self.collectionView numberOfItemsInSection:attribute.indexPath.section] - 1)
        {
            UICollectionViewLayoutAttributes* inputAttributes =
            [UICollectionViewLayoutAttributes
             layoutAttributesForSupplementaryViewOfKind:self.inputViewKind
             withIndexPath:[NSIndexPath
                            indexPathForItem:0
                            inSection:attribute.indexPath.section]];
            
            
            
            CGRect currentFrame = attribute.frame;
            
            currentFrame.origin.x = CGRectGetMaxX(attribute.frame) + self.minimumInteritemSpacing;
            
            CGFloat availableWidth = (self.collectionView.bounds.size.width -
                                      self.sectionInset.right -
                                      currentFrame.origin.x);
            if (availableWidth > self.minimumInputWidth) {
                currentFrame.size.width = availableWidth;
            } else {
                currentFrame.size.width = self.maximumWidth;
                currentFrame.origin.x = self.sectionInset.left;
                currentFrame.origin.y = CGRectGetMaxY(attribute.frame) + self.minimumLineSpacing;
                
                _inputAddedHeight += CGRectGetMaxY(currentFrame) - CGRectGetMaxY(attribute.frame);
            }
            
            inputAttributes.frame = currentFrame;
            
            [attributes addObject:inputAttributes];
        }
    }
    
    return attributes.copy;
}

- (CGSize)collectionViewContentSize
{
    CGSize size = [super collectionViewContentSize];
    size.height += _inputAddedHeight;
    return size;
}

@end
