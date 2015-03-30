//
//  RBGTagListCollectionViewCell.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewCell.h"
#import "RBGTagListCollectionViewModel.h"

@interface RBGTagListCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel* textLabel;

@end

#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation RBGTagListCollectionViewCell

- (void)awakeFromNib
{
    RAC(self, textLabel.text) = RACObserve(self, viewModel.text);
}

@end
