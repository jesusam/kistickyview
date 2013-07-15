//
//  StickyView.m
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#define DEFAULT_HEADER_HEIGHT 165
#define DEFAULT_HEADER_HEIGHT_STUCK 45

#define DEFAULT_LEFT_BUTTON_WIDTH 45
#define DEFAULT_LEFT_BUTTON_HEIGHT 45
#define DEFAULT_LEFT_BUTTON_X 0
#define DEFAULT_LEFT_BUTTON_Y (DEFAULT_HEADER_HEIGHT - DEFAULT_LEFT_BUTTON_HEIGHT)

#define DEFAULT_RIGHT_BUTTON_WIDTH 45
#define DEFAULT_RIGHT_BUTTON_HEIGHT 45
#define DEFAULT_RIGHT_BUTTON_Y (DEFAULT_HEADER_HEIGHT - DEFAULT_RIGHT_BUTTON_HEIGHT)

#define DEFAULT_CENTER_PIECE_HEIGHT

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
        [contentView setContentInset:UIEdgeInsetsMake(headerView.frame.size.height,
                                                      0,
                                                      0,
                                                      0)];
        
        [self setHeaderView:headerView];
        [self setContentView:contentView];
        [self setHeaderHeightStuck:headerHeightStuck];
        
        [self addSubview:self.contentView];
        [self addSubview:self.headerView];
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
    _headerView = headerView;
    if (self.contentView) {
        [self.contentView setFrame:self.frame];
        [self.contentView setContentInset:UIEdgeInsetsMake(self.headerView.frame.size.height,
                                                          0,
                                                          0,
                                                          0)];
    }
}

- (void)setContentView:(UIScrollView *)contentView
{
    if (self.headerView) {
        [contentView setFrame:self.frame];
        [self.contentView setContentInset:UIEdgeInsetsMake(self.headerView.frame.size.height,
                                                            0,
                                                            0,
                                                            0)];
    }
    _contentView = contentView;
}

@end
