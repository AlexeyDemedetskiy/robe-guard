//
//  RBGTagListInputViewModel.h
//  Robe Guard
//
//  Created by Alexey Demedckiy on 02.04.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

@import UIKit;

@class RBGTagListInputController;
@protocol RBGTagListInputControllerDelegate <NSObject>

- (void) inputControlller:(RBGTagListInputController*)controller
              didEnterTag:(NSString*)text;

- (void)inputControllerDidSelectLastTag:(RBGTagListInputController*)inputController;
- (void)inputControllerDidDeleteLastTag:(RBGTagListInputController*)inputController;

@end

@interface RBGTagListInputController : NSObject

+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)newWithTextField:(UITextField*)textField;

@property (weak) id<RBGTagListInputControllerDelegate> delegate;

@property BOOL objectHasTags;
@property BOOL objectHasSelectedTag;

@property (readonly) NSString* currentText;

@end