//
//  KIStickyViewController.h
//  StickyViewController
//
//  Created by Jesus Morales on 7/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "StickyViewController.h"
@class KIStickyView;

@interface KIStickyViewController : StickyViewController

@property (strong, nonatomic)KIStickyView *view;
@property (assign, nonatomic)BOOL headerIsStuckAtTop;

@end
