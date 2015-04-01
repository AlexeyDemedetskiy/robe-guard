//
//  RBGTag.h
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBGTag : NSObject

@property (readonly) NSString* title;

+ (instancetype)newTagWithTitle:(NSString*)title;

- (BOOL)isEqualToTag:(RBGTag*)tag;

@end
