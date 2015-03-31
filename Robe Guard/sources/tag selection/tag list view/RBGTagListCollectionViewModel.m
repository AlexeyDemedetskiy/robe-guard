//
//  RBGTagListCollectionViewModel.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagListCollectionViewModel.h"

#import "NSObject+RBGUpdateState.h"
#import "NSNumber+RBGDoAction.h"
#import "NSArray+RBGHighOrder.h"

@interface RBGTagListCollectionViewModel ()

+ (instancetype)newWithTags:(NSArray*)tags;

@property (nonatomic, strong) NSArray* tags;

@end

@interface RBGTagListCollectionCellViewModel ()

+ (instancetype)newWithText:(NSString*)text;

@property (nonatomic, strong) NSString* text;

@end



@implementation RBGTagListCollectionViewModel

+ (instancetype)newWithTags:(NSArray *)tags
{
    return [self rbg_newWithState:^(RBGTagListCollectionViewModel* vm) {
        vm.tags = tags;
    }];
}

+ (instancetype)newWithTags:(NSArray *)tags shuffledUpTo:(NSUInteger)count
{
    return [self newWithTags:
            [@(count) rbg_yield:
             ^id(NSUInteger step) {
                 return tags.count == 0 ? nil : tags[arc4random_uniform((u_int32_t)tags.count)];
             }]];
}

+ (instancetype)newWithTagsNames:(NSArray *)tags
{
    return [self
            newWithTags:[tags
                         rbg_map:^id(NSString* object) {
                             return [RBGTagListCollectionCellViewModel newWithText:object];
                         }]];
}

+ (instancetype)newTestingViewModel
{
    return [self newWithTagsNames:
            @[
              @"Nike", @"Adidas", @"Zara", @"Gucci", @"Topshop", @"Dior", @"Prada",
              @"Vans", @"Jordan", @"Louis", @"Burberry", @"H&M", @"Michael",
              @"Forever", @"Valentino", @"Versace", @"Givenchy", @"Victoria's", @"Hollister",
              @"Converse", @"Nice", @"Asos", @"Marc", @"Armani", @"Dolce", @"Hermès", @"Abercrombie",
              @"Ralph", @"Balenciaga", @"Balmain", @"Moschino", @"Supreme", @"Miu", @"Chloé",
              @"Jimmy", @"Kenzo", @"Kate", @"New", @"Puma", @"Guess", @"Urban", @"Aéropostale",
              @"Calvin", @"American", @"Ferragamo", @"Free", @"Target", @"American", @"Steve", @"Ray",
              @"Roxy", @"Gap", @"Tory", @"J.Crew", @"Lacoste", @"Under", @"Giuseppe", @"River",
              @"Stüssy", @"Foot", @"Toms", @"Levi's", @"Pacsun", @"lululemon", @"Oakley", @"Brandy",
              @"Dr.", @"Jeffrey", @"Berksha", @"Victoria's", @"Alexander", @"Lanvin", @"Timberland",
              @"Alexander", @"Nordstrom", @"Tommy", @"Anthropologie", @"Donna", @"Black", @"Hot",
              @"Hurley", @"DGK", @"Diesel", @"Diamond", @"Manolo", @"Dailylook", @"Stella", @"Reebok",
              @"Isabel", @"Stradivarius", @"Karl", @"Billabong", @"Roberto", @"Volcom", @"Tod's", @"Nasty",
              @"DC", @"The", @"Ugg", @"ELIE", @"Sneaker", @"Juicy", @"Quiksilver", @"Milin", @"Nixon",
              @"Aldo", @"Alex", @"Hugo", @"Pull&Bear", @"Rip", @"Lorna", @"Charlotte", @"Young",
              @"Old", @"Triangl", @"Vera", @"Watch", @"Schutz", @"UNIF", @"Mulberry", @"Last",
              @"Lilly", @"Element", @"Misguided", @"Asics", @"Topman", @"Kardashian", @"BVLGARI", @"DVF", @"Fossil",
              @"Vivienne", @"The", @"xobetseyjohnson", @"REI", @"Oscar", @"A.P.C.", @"Zumiez", @"Cotton", @"Sherri",
              @"Stance", @"QUEEN", @"Bottega", @"Wildfox", @"Finish", @"Banana", @"Fresh", @"Herschel", @"Acne",
              @"Opening", @"Maison",
              ]];
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    return [self.class newTestingViewModel];
}

@end

@implementation RBGTagListCollectionCellViewModel

+ (instancetype)newWithText:(NSString *)text
{
    return [self rbg_newWithState:^(RBGTagListCollectionCellViewModel* vm) {
        vm.text = text;
    }];
}

@end
