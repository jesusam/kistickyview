//
//  StickyViewController.h
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StickyView;

@interface StickyViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic)StickyView *view;

@end
