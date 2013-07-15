//
//  KIStickyView.m
//  StickyViewController
//
//  Created by Jesus Morales on 7/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#define DEFAULT_HEADER_HEIGHT 165
#define DEFAULT_HEADER_HEIGHT_STUCK 45

#define DEFAULT_CENTER_PIECE_HEIGHT 106
#define DEFAULT_CENTER_PIECE_WIDTH 106

#define DEFAULT_LEFT_BUTTON_WIDTH 45
#define DEFAULT_LEFT_BUTTON_HEIGHT 45
#define DEFAULT_LEFT_BUTTON_X 0
#define DEFAULT_LEFT_BUTTON_Y (DEFAULT_HEADER_HEIGHT - DEFAULT_LEFT_BUTTON_HEIGHT)

#define DEFAULT_RIGHT_BUTTON_WIDTH 45
#define DEFAULT_RIGHT_BUTTON_HEIGHT 45
#define DEFAULT_RIGHT_BUTTON_Y (DEFAULT_HEADER_HEIGHT - DEFAULT_RIGHT_BUTTON_HEIGHT)

#import "KIStickyView.h"

@implementation KIStickyView

@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;
@synthesize headerCenterPieceImageView = _headerCenterPieceImageView;

- (id)initWithFrame:(CGRect)frame
         headerView:(UIView *)headerView
        contentView:(UIScrollView *)contentView
  headerHeightStuck:(int)headerHeightStuck
         leftButton:(UIButton *)leftButton
        rightButton:(UIButton *)rightButton
headerCenterPieceImageView:(UIImageView *)headerCenterPieceImageView
{
    self = [super initWithFrame:frame headerView:headerView contentView:contentView headerHeightStuck:headerHeightStuck];
    if (self) {
        [self setLeftButton:leftButton];
        [self setRightButton:rightButton];
        [self setHeaderCenterPieceImageView:headerCenterPieceImageView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0,
                                         DEFAULT_HEADER_HEIGHT - DEFAULT_LEFT_BUTTON_HEIGHT,
                                         DEFAULT_LEFT_BUTTON_WIDTH,
                                         DEFAULT_LEFT_BUTTON_HEIGHT)];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(frame.size.width - DEFAULT_RIGHT_BUTTON_WIDTH,
                                          DEFAULT_HEADER_HEIGHT - DEFAULT_RIGHT_BUTTON_HEIGHT,
                                          DEFAULT_RIGHT_BUTTON_WIDTH,
                                          DEFAULT_RIGHT_BUTTON_HEIGHT)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2 - DEFAULT_CENTER_PIECE_WIDTH/2,
                                                                                      DEFAULT_HEADER_HEIGHT/2 - DEFAULT_CENTER_PIECE_HEIGHT/2,
                                                                                      DEFAULT_CENTER_PIECE_WIDTH,
                                                                                      DEFAULT_CENTER_PIECE_HEIGHT)];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  frame.size.width,
                                                                  DEFAULT_HEADER_HEIGHT)];
    UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:frame];
    [headerView setBackgroundColor:[UIColor blueColor]];
    [contentView setBackgroundColor:[UIColor yellowColor]];
    [leftButton setBackgroundColor:[UIColor redColor]];
    [rightButton setBackgroundColor:[UIColor purpleColor]];
    [imageView setBackgroundColor:[UIColor blackColor]];
    return [self initWithFrame:frame headerView:headerView contentView:contentView headerHeightStuck:DEFAULT_HEADER_HEIGHT_STUCK leftButton:leftButton rightButton:rightButton headerCenterPieceImageView:imageView];
}

- (void)setLeftButton:(UIButton *)leftButton
{
    if (self.headerView) {
        [self.headerView addSubview:leftButton];
    }
    _leftButton = leftButton;
}

- (void)setRightButton:(UIButton *)rightButton
{
    if (self.headerView) {
        [self.headerView addSubview:rightButton];
    }
    _rightButton = rightButton;
}

- (void)setHeaderCenterPieceImageView:(UIImageView *)headerCenterPieceImageView
{
    if (self.headerView) {
        [self.headerView addSubview:headerCenterPieceImageView];
    }
    _headerCenterPieceImageView = headerCenterPieceImageView;
}

@end
