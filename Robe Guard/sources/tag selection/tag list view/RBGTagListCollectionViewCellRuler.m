//
//  RBGTagListCollectionViewCellRuler.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewCellRuler.h"
#import "RBGTagListCollectionViewCell.h"

#import "NSObject+RBGUpdateState.h"

@interface RBGTagListCollectionViewCellRuler ()

@property (nonatomic, strong) RBGTagListCollectionViewCell* cell;
@property (nonatomic, assign) CGSize defaultCellSize;

@end

@implementation RBGTagListCollectionViewCellRuler

RBGTagListCollectionViewCell* cellFromNib(UINib* nib)
{
    for (id object in [nib instantiateWithOwner:nil options:nil]) {
        if ([object isKindOfClass:[RBGTagListCollectionViewCell class]]) {
            return object;
        }
    };
    
    return nil;
}

CGSize measureCell(RBGTagListCollectionViewCell* cell)
{
    return [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

+ (instancetype)newWithMetricCellNib:(UINib *)cellNib
{
    return [self rbg_newWithState:^(RBGTagListCollectionViewCellRuler* self) {
        self.cell = cellFromNib(cellNib);
        self.defaultCellSize = measureCell(self.cell);
    }];
}

- (CGSize)cellSizeForViewModel:(RBGTagListCollectionCellViewModel *)viewModel
                boundedByWidth:(CGFloat)maxWidth
{
    [self.cell prepareForReuse];
    self.cell.viewModel = viewModel;
    
    CGSize optimalSize = measureCell(self.cell);
    optimalSize.width = MIN(optimalSize.width, maxWidth);
    
    return optimalSize;
}

@end
