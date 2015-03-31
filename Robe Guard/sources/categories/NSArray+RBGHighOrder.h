//
//  NSArray+RBGHighOrder.h
//  Robe Guard
//
//  Created by Alexey Demedckiy on 31.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RBGHighOrder)

- (NSArray*)rbg_map:(id (^)(id object))mapBlock;

@end
