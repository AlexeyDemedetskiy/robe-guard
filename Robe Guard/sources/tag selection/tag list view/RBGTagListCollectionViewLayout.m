//
//  RBGTagListCollectionViewLayout.m
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewLayout.h"

#import "NSNumber+RBGDoAction.h"

@interface RBGTagListCollectionViewLayout ()

@property NSArray* allAttributes;
@property NSDictionary* attributesMap;

@end

@implementation RBGTagListCollectionViewLayout

+ (NSString *)inputViewKind
{
    return @"com.robe-guard.tag-selection.input";
}

- (NSString *)inputViewKind
{
    return [self.class inputViewKind];
}

#pragma mark UICollectionViewLayoutSubclassHook

- (void)prepareLayout
{
    _maximumWidth = (self.collectionView.bounds.size.width -
                     self.sectionInsets.left -
                     self.sectionInsets.right);
    
    self.allAttributes = [self generateAllAttributes];
    NSArray* indexPaths = [self.allAttributes valueForKey:@"indexPath"];
    
    self.attributesMap = [NSDictionary dictionaryWithObjects:self.allAttributes forKeys:indexPaths];
}

- (NSArray*)generateAllAttributes
{
    NSMutableArray* attributes = [NSMutableArray new];
    
    CGFloat __block nextLineTop = self.sectionInsets.top;
    
    [@([self.collectionView numberOfSections]) rbg_do:^(NSUInteger section)
     {
         CGFloat __block newX = self.sectionInsets.left;
         CGFloat __block newY = nextLineTop;
         
         [@([self.collectionView numberOfItemsInSection:section]) rbg_do:^(NSUInteger item)
          {
              NSIndexPath* indexPath = [NSIndexPath indexPathForItem:item inSection:section];
              
              UICollectionViewLayoutAttributes* itemAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
              [attributes addObject:itemAttributes];
              
              CGFloat remainingWidth = self.collectionView.bounds.size.width - self.sectionInsets.right - newX;
              CGSize itemSize = [self.delegate layout:self sizeForItemAtIndexPath:indexPath];
              
              if (itemSize.width > remainingWidth)
              { // Move to next line
                  newX = self.sectionInsets.left;
                  newY = nextLineTop;
              }
              
              itemAttributes.frame = (CGRect){
                  .origin = {
                      .x = newX,
                      .y = newY,
                  },
                  .size = itemSize,
              };
              
              newX = CGRectGetMaxX(itemAttributes.frame) + self.itemSpacing;
              newY = CGRectGetMinY(itemAttributes.frame);
              nextLineTop = MAX(nextLineTop, CGRectGetMaxY(itemAttributes.frame) + self.lineSpacing);
          }];
         
         if ([self.delegate layout:self shouldInsertInputViewAtSection:section])
         {
             NSIndexPath* indexPath = [NSIndexPath indexPathForItem:[self.collectionView numberOfItemsInSection:section]
                                                          inSection:section];
             UICollectionViewLayoutAttributes* inputViewAttrubutes = [UICollectionViewLayoutAttributes
                                                                      layoutAttributesForSupplementaryViewOfKind:self.inputViewKind
                                                                      withIndexPath:indexPath];
             [attributes addObject:inputViewAttrubutes];
             
             CGFloat remainingWidth = self.collectionView.bounds.size.width - self.sectionInsets.right - newX;
             if (remainingWidth < self.minimumInputSize.width)
             {
                 newX = self.sectionInsets.left;
                 newY = nextLineTop;
                 
                 // reset remaining width to maximum width
                 remainingWidth = self.collectionView.bounds.size.width - self.sectionInsets.right - newX;
             }
             
             inputViewAttrubutes.frame = (CGRect){
                 .origin = {
                     .x = newX,
                     .y = newY,
                 },
                 .size = {
                     .width = remainingWidth,
                     .height = self.minimumInputSize.height,
                 },
             };
             
             nextLineTop = MAX(nextLineTop, CGRectGetMaxY(inputViewAttrubutes.frame) + self.lineSpacing);
         }
     }];
    
    return attributes.copy;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;
{
    return self.allAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return self.attributesMap[indexPath];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind
                                                                     atIndexPath:(NSIndexPath *)indexPath;
{
    return self.attributesMap[indexPath];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
{
    return NO;
}

- (CGSize)collectionViewContentSize;
{
    return CGSizeMake(self.collectionView.bounds.size.width,
                      CGRectGetMaxY([[self.allAttributes lastObject] frame]) + self.sectionInsets.bottom);
}

@end
