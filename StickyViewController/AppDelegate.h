//
//  AppDelegate.h
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KIStickyViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) KIStickyViewController *viewController;
@property (assign, nonatomic) int i;
@property (assign, nonatomic) int j;

- (void)changeBackdrop;
- (void)changeContentView;

@end
