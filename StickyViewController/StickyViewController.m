//
//  StickyViewController.m
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "StickyViewController.h"
#import "StickyView.h"

@interface StickyViewController ()

@end

@implementation StickyViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setView:[[StickyView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)]];
        [self.view.contentView setDelegate:self];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.view.contentView.contentOffset.y >= -self.view.headerHeightStuck) {
        [self.view.headerView setFrame:CGRectMake(self.view.headerView.frame.origin.x,
                                                 self.view.headerHeightStuck - self.view.headerView.frame.size.height,
                                                 self.view.headerView.frame.size.width,
                                                  self.view.headerView.frame.size.height)];
    }
    else if (self.view.contentView.contentOffset.y > -self.view.headerView.frame.size.height) {
        [self.view.headerView setFrame:CGRectMake(self.view.headerView.frame.origin.x,
                                                 -self.view.contentView.contentOffset.y - self.view.headerView.frame.size.height,
                                                 self.view.headerView.frame.size.width,
                                                  self.view.headerView.frame.size.height)];
    }
    else if (self.view.contentView.contentOffset.y <= -self.view.headerView.frame.size.height) {
        [self.view.headerView setFrame:CGRectMake(self.view.headerView.frame.origin.x,
                                                  0,
                                                  self.view.headerView.frame.size.width,
                                                  self.view.headerView.frame.size.height)];
    }
}

@end
