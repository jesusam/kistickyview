//
//  StickyView.m
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#define DEFAULT_HEADER_HEIGHT 165
#define DEFAULT_HEADER_HEIGHT_STUCK 45

#import "StickyView.h"

@implementation StickyView

@synthesize headerView = _headerView;
@synthesize contentView = _contentView;
@synthesize headerHeightStuck = _headerHeightStuck;

- (id)initWithFrame:(CGRect)frame
         headerView:(UIView *)headerView
        contentView:(UIScrollView *)contentView
  headerHeightStuck:(int)headerHeightStuck;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setHeaderView:headerView];
        [self setContentView:contentView];
        [self.contentView setContentOffset:CGPointMake(self.contentView.contentOffset.x, -self.headerHeightStuck) animated:NO];
        [self setHeaderHeightStuck:headerHeightStuck];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  frame.size.width,
                                                                  DEFAULT_HEADER_HEIGHT)];
    UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                               DEFAULT_HEADER_HEIGHT,
                                                                               frame.size.width,
                                                                               frame.size.height - DEFAULT_HEADER_HEIGHT)];
    
    [headerView setBackgroundColor:[UIColor blueColor]];
    [contentView setBackgroundColor:[UIColor yellowColor]];
    
    [contentView setContentSize:CGSizeMake(contentView.frame.size.width, contentView.frame.size.height)];
    
    return [self initWithFrame:frame headerView:headerView contentView:contentView headerHeightStuck:DEFAULT_HEADER_HEIGHT_STUCK];
}

- (void)setHeaderView:(UIView *)headerView
{
    if (self.headerView) {
        [self.headerView removeFromSuperview];
    }
    if (self.contentView) {
        [self.contentView setContentInset:UIEdgeInsetsMake(headerView.frame.size.height,
                                                           0,
                                                           0,
                                                           0)];
    }
    [self insertSubview:headerView atIndex:1];
    _headerView = headerView;
}

- (void)setContentView:(UIScrollView *)contentView
{
    NSLog(@"CHANGING CONTENTVIEW");
    if (self.headerView) {
        [contentView setContentInset:UIEdgeInsetsMake(self.headerView.frame.size.height,
                                                           0,
                                                           0,
                                                           0)];
        [contentView setContentOffset:CGPointMake(self.contentView.contentOffset.x, -(self.headerView.frame.origin.y + self.headerView.frame.size.height)) animated:NO];
    }
    [contentView setFrame:self.frame];
    [self.contentView removeFromSuperview];
    [self insertSubview:contentView atIndex:0];
    [contentView setDelegate:self.contentView.delegate];
    _contentView = contentView;
}

- (void)setHeaderHeightStuck:(int)headerHeightStuck
{
    if (self.headerView && (self.headerView.frame.origin.y + self.headerView.frame.size.height) < headerHeightStuck) {
        [self.headerView setFrame:CGRectMake(self.headerView.frame.origin.x,
                                            headerHeightStuck - self.headerView.frame.size.height,
                                            self.headerView.frame.size.width,
                                             self.headerView.frame.size.height)];
        [self.contentView setContentOffset:CGPointMake(self.contentView.contentOffset.x,
                                                      headerHeightStuck)];
    }
    _headerHeightStuck = headerHeightStuck;
}

@end
