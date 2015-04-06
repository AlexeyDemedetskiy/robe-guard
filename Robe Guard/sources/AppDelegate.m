//
//  AppDelegate.m
//  Robe Guard
//
//  Created by Алексей Демедецкий on 28.03.15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

#import "RBGTagSelectionStoryboard.h"
#import "RBGTagListCollectionViewController.h"

#import "RBGTagListCollectionViewModel.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    RBGTagSelectionStoryboard* sb = [RBGTagSelectionStoryboard new];
    
    RBGTagListCollectionViewController* vc = [sb instantiateTagListViewController];
    vc.viewModel = [RBGTagListCollectionViewModel newTestingViewModel];
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
