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

@interface RBGTagListInputView : UICollectionReusableView<UITextFieldDelegate>

@property UITextField* inputField;

@end

@implementation RBGTagListInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    self.inputField = [UITextField rbg_newWithState:^(UITextField* textField) {
        textField.translatesAutoresizingMaskIntoConstraints = NO;
        textField.delegate = self;
        
        [self addSubview:textField];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[input]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:@{@"input":textField}]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[input]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:@{@"input":textField}]];
    }];
    
    return self;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end


@interface RBGTagListCollectionViewController ()<RBGTagListCollectionViewLayoutDelegate>

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
    
    [self.collectionView registerClass:[RBGTagListInputView class]
            forSupplementaryViewOfKind:[RBGTagListCollectionViewLayout inputViewKind]
                   withReuseIdentifier:@"com.robe-guard.tag-selection.input"];
    
    [self.collectionView
     rac_liftSelector:@selector(reloadData)
     withSignalOfArguments:[RACObserve(self, viewModel.tags) mapReplace:[RACTuple new]]];
    
    self.cellRuler = [RBGTagListCollectionViewCellRuler
                      newWithMetricCellNib:[self nibForTagCell]];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [@[ @1, @([self.viewModel.tags count])][section] integerValue];
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:[RBGTagListCollectionViewLayout inputViewKind]]) {
        return [[collectionView
                 dequeueReusableSupplementaryViewOfKind:[RBGTagListCollectionViewLayout inputViewKind]
                 withReuseIdentifier:@"com.robe-guard.tag-selection.input"
                 forIndexPath:indexPath]
                rbg_update:^(UIView* x) {
                    // TODO: Link to view model
                }];
    }
    
    return nil;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)layout:(RBGTagListCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellRuler cellSizeForViewModel:self.viewModel.tags[indexPath.row]
                                 boundedByWidth:collectionViewLayout.maximumWidth];
}

- (BOOL)layout:(RBGTagListCollectionViewLayout *)collectionViewLayout shouldInsertInputViewAtSection:(NSUInteger)sectionIndex
{
    return (sectionIndex == 0);
}

@end
