//
//  NSObject+RBGUpdateState.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RBGUpdateState)

+ (instancetype)rbg_newWithState:(void (^)(id x))stateBlock;
- (instancetype)rbg_update:(void (^)(id x))updateBlock;

@end
