//
//  AppDelegate.m
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "AppDelegate.h"
#import "KIStickyViewController.h"
#import "KIStickyView.h"

@implementation AppDelegate

@synthesize viewController = _viewController;
@synthesize i = _i;
@synthesize j = _j;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _i = 1;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[KIStickyViewController alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 178)];
    [imageView setImage:[UIImage imageNamed:@"temp-header-backdrop.png"]];
    [self.viewController.view setHeaderView:imageView];
    [self.viewController.view setLeftButtonImage:[UIImage imageNamed:@"btn-back-normal.png"]];
    [self.viewController.view setRightButtonImage:[UIImage imageNamed:@"btn-back-active.png"]];
    [self.viewController.view.rightButton addTarget:self action:@selector(changeBackdrop) forControlEvents:UIControlEventTouchUpInside];
    [self.viewController.view.leftButton addTarget:self action:@selector(changeContentView) forControlEvents:UIControlEventTouchUpInside];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)changeContentView
{
    UIScrollView *scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    if (_j % 2 == 1) {
        [scroller setBackgroundColor:[UIColor purpleColor]];
        [scroller setContentSize:CGSizeMake(320, 1000)];
    }
    else {
        [scroller setBackgroundColor:[UIColor blueColor]];
        [scroller setContentSize:CGSizeMake(320, 1000)];
    }
    [self.viewController.view setContentView:scroller];
    _j++;
}

- (void)changeBackdrop
{
    if (_i % 4 == 1) {
        [self.viewController.view startTicking];
    }
    else if (_i % 4 == 2) {
        UIImage *image = [UIImage imageNamed:@"Header.png"];
        [self.viewController.view setBackdropImage:image];
    }
    else if (_i % 4 == 3) {
        [self.viewController.view startTicking];
    }
    else {
        UIImage *image = [UIImage imageNamed:@"temp-header-backdrop.png"];
        [self.viewController.view setBackdropImage:image];
    }
    NSLog(@"change");
    _i++;
}

@end
