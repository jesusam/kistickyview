//
//  KIStickyViewController.m
//  StickyViewController
//
//  Created by Jesus Morales on 7/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "KIStickyViewController.h"
#import "KIStickyView.h"

@interface KIStickyViewController ()

@end

@implementation KIStickyViewController

@synthesize headerIsStuckAtTop = _headerIsStuckAtTop;

- (id)init
{
    self = [super init];
    if (self) {
        [self setView:[[KIStickyView alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     [UIScreen mainScreen].bounds.size.width,
                                                                     [UIScreen mainScreen].bounds.size.height - 20)]];
        [self.view.contentView setDelegate:self];
        [self.view.contentView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000)];
        [self setHeaderIsStuckAtTop:NO];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.headerIsStuckAtTop) {
        [super scrollViewDidScroll:scrollView];
    }
}

- (void)setHeaderIsStuckAtTop:(BOOL)headerIsStuckAtTop
{
    if (headerIsStuckAtTop) {
        [self.view.headerView setFrame:CGRectMake(self.view.headerView.frame.origin.x,
                                                  self.view.headerHeightStuck - self.view.headerView.frame.size.height,
                                                  self.view.headerView.frame.size.width,
                                                  self.view.headerView.frame.size.height)];
        [self.view.contentView setContentInset:UIEdgeInsetsMake(self.view.headerView.frame.origin.y + self.view.headerView.frame.size.height,
                                                                0,
                                                                0,
                                                                0)];
    }
    else {
        [self.view.headerView setFrame:CGRectMake(self.view.headerView.frame.origin.x,
                                                  0,
                                                  self.view.headerView.frame.size.width,
                                                  self.view.headerView.frame.size.height)];
        [self.view.contentView setContentInset:UIEdgeInsetsMake(self.view.headerView.frame.origin.y + self.view.headerView.frame.size.height,
                                                                0,
                                                                0,
                                                                0)];
    }
    _headerIsStuckAtTop = headerIsStuckAtTop;
}

@end
