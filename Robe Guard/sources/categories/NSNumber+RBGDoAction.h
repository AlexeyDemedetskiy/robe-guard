//
//  NSNumber+RBGDoAction.h
//  Robe Guard
//
//  Created by Алексей Демедецкий on 30.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSNumber (RBGDoAction)

- (void)rbg_do:(void (^)(NSUInteger step))doBlock;
- (NSArray*)rbg_yield:(id (^)(NSUInteger step))yieldBlock;

@end
