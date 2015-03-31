//
//  RBGTagListCollectionViewController.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewController.h"
#import "RBGTagListCollectionViewModel.h"
#import "RBGTagSelectionStoryboard.h"

#import "RBGTagListCollectionViewLayout.h"

#import "RBGTagListCollectionViewCellRuler.h"
#import "RBGTagListCollectionViewCell.h"

#import "NSObject+RBGUpdateState.h"

#import <ReactiveCocoa/ReactiveCocoa.h>




@interface RBGTagListCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout* flowLayout;

@property (nonatomic, strong) RBGTagListCollectionViewCellRuler* cellRuler;

@end

@implementation RBGTagListCollectionViewController

- (UINib*)nibForTagCell
{
    NSDictionary* nibMap = [self.collectionView valueForKey:@"_cellNibDict"];
    UINib* nib = nibMap[self.rbg_tagSelectionStoryboard.IDs.cells.tagListCell];
    
    NSAssert(nib != nil, @"Cannot find nib corresponding to cell");
    return nib;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [self.collectionView
     rac_liftSelector:@selector(reloadData)
     withSignalOfArguments:[RACObserve(self, viewModel.tags) mapReplace:[RACTuple new]]];
    
    self.cellRuler = [RBGTagListCollectionViewCellRuler
                      newWithMetricCellNib:[self nibForTagCell]];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewModel.tags count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[collectionView
             dequeueReusableCellWithReuseIdentifier:self.rbg_tagSelectionStoryboard.IDs.cells.tagListCell
             forIndexPath:indexPath]
            rbg_update:^(RBGTagListCollectionViewCell* cell) {
                cell.viewModel = self.viewModel.tags[indexPath.row];
            }];
}

#pragma mark <UICollectionViewDelegate>

- (CGSize) collectionView:(UICollectionView *)collectionView
                   layout:(RBGTagListCollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellRuler cellSizeForViewModel:self.viewModel.tags[indexPath.row]
                                 boundedByWidth:collectionViewLayout.maximumWidth];
}

@end
