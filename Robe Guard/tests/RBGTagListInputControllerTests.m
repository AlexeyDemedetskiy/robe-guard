//
//  RBGTagListInputViewModelTests.m
//  Robe Guard
//
//  Created by Alexey Demedckiy on 02.04.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RBGTagListInputController.h"

@interface RBGTagListInputViewModelTests : XCTestCase

@property OCMockObject<RBGTagListInputControllerDelegate>* delegate;
@property UITextField* textField;
@property RBGTagListInputController<UITextFieldDelegate>* inputController;

@end

@implementation RBGTagListInputViewModelTests

- (void)setUp
{
    [super setUp];
    
    self.delegate = OCMProtocolMock(@protocol(RBGTagListInputControllerDelegate));
    self.textField = OCMPartialMock([UITextField new]);
    
    self.inputController = (id)[RBGTagListInputController newWithTextField:self.textField];
    self.inputController.delegate = self.delegate;
}

- (void)tearDown
{
    self.inputController = nil;
    self.delegate = nil;
    self.textField = nil;
    
    [super tearDown];
}

- (void)testPlaceholderVisibility
{
    self.textField.placeholder = @"Example text";
    self.inputController.objectHasTags = NO;
    
    XCTAssertEqualObjects(self.textField.placeholder, @"Example text");
    
    self.inputController.objectHasTags = YES;
    XCTAssertEqualObjects(self.textField.placeholder, @"");
}

- (void)testCurrentText
{
    self.textField.text = @"Text";
    XCTAssertEqualObjects(self.inputController.currentText, @"Text");
}

- (void)testCaretVisibility
{
    self.inputController.objectHasTags = YES;
    self.inputController.objectHasSelectedTag = NO;
    
    XCTAssertEqual(self.textField.alpha, 1);
    
    self.inputController.objectHasSelectedTag = YES;
    XCTAssertEqual(self.textField.alpha, 0);
}

- (void)textBackspaceWithText
{
    self.textField.text = @"ab";
    [self.inputController
     textField:self.textField
     shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
}

- (void)testSimpleTextInput
{
    
}

- (void)testTagSelection
{
    
}

@end
