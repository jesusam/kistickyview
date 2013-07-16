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

#define HEADER_TRIANGLE_HEIGHT 12

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
        _leftButton = leftButton;
        _rightButton = rightButton;
        [self.headerView addSubview:_leftButton];
        [self.headerView addSubview:_rightButton];
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
      //****************************************************//
     //MIGHT NEED TO DELETE THESE BACKGROUND COLOR SETTINGS//
    //****************************************************//
    [contentView setBackgroundColor:[UIColor yellowColor]];
    return [self initWithFrame:frame headerView:headerView contentView:contentView headerHeightStuck:DEFAULT_HEADER_HEIGHT_STUCK leftButton:leftButton rightButton:rightButton headerCenterPieceImageView:imageView];
}

- (void)setBackdropImage:(UIImage *)backdropImage
{
      //*********************************************************//
     //SHOULD ADD A CHECK FOR THE FADER VIEW NOT BEING AVAILABLE//
    //*********************************************************//
    if (self.headerView) {
        if ([self.headerView isKindOfClass:[UIImageView class]]) {
            [[self.headerView.subviews objectAtIndex:(self.headerView.subviews.count - 1)] removeFromSuperview];
              //**************************************************************************************//
             //THIS LINE WILL ALSO NEED TO CHECK IF THE CENTER PICK IS AVAILABLE AND ADJUST THE INDEX//
            //**************************************************************************************//
            [[self.headerView.subviews objectAtIndex:0] removeFromSuperview];
            [(UIImageView *)self.headerView setImage:backdropImage];
        }
    }
}

- (void)setLeftButtonImage:(UIImage *)leftButtonImage
{
    [self.leftButton setImage:leftButtonImage forState:UIControlStateNormal];
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage
{
    [self.rightButton setImage:rightButtonImage forState:UIControlStateNormal];
}

- (void)setHeaderCenterPieceImageView:(UIImageView *)headerCenterPieceImageView
{
    if (self.headerCenterPieceImageView) {
        [self.headerCenterPieceImageView removeFromSuperview];
    }
    if (self.headerView) {
        [self.headerView insertSubview:headerCenterPieceImageView atIndex:0];
    }
    _headerCenterPieceImageView = headerCenterPieceImageView;
}

  //***********************************************************//
 //MAKE SURE TO CORRECTLY INIT THE BUTTONS IN THE INIT METHODS//
//***********************************************************//
  //*************************************//
 //CHANGE THE SET BUTTON CALLS TO _CALLS//
//*************************************//
  //*****************************************************************************************//
 //HAVE TO SET THE CONTENT OFFSET OF THE SCROLLVIEW TO BEGIN WITH BECAUSE IT'S STARTING AT 0//
//*****************************************************************************************//
- (void)setHeaderView:(UIView *)headerView
{
    [super setHeaderView:headerView];
    if ([headerView isKindOfClass:[UIImageView class]]) {
        [headerView setUserInteractionEnabled:YES];
        [self.rightButton setFrame:CGRectMake(self.rightButton.frame.origin.x,
                                              self.headerView.frame.size.height - (HEADER_TRIANGLE_HEIGHT + self.rightButton.frame.size.height),
                                              self.rightButton.frame.size.width,
                                              self.rightButton.frame.size.height)];
        [self.leftButton setFrame:CGRectMake(self.leftButton.frame.origin.x,
                                             self.headerView.frame.size.height - (HEADER_TRIANGLE_HEIGHT + self.leftButton.frame.size.height),
                                             self.leftButton.frame.size.width,
                                             self.leftButton.frame.size.height)];
        [self.headerView addSubview:self.rightButton];
        [self.headerView addSubview:self.leftButton];
        [self.headerView addSubview:self.headerCenterPieceImageView];
        [self setHeaderHeightStuck:(HEADER_TRIANGLE_HEIGHT + self.leftButton.frame.size.height)];
    }
}

- (void)startTicking
{
      //****************************************************************************//
     //SHOULD I MAKE THIS SPINNER A SUBVIEW OF THE HEADER VIEW OR OF THE FADER VIEW//
    //****************************************************************************//
    UIView *faderView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 self.headerView.frame.size.width,
                                                                 self.headerView.frame.size.height - HEADER_TRIANGLE_HEIGHT)];
    [faderView setBackgroundColor:[UIColor blackColor]];
    [faderView setAlpha:0.5f];
    //****************************************************************//
    //HAVE TO ADD THIS CHECK FOR WHEN THE CENTER PIECE PICK IS NOT NIL//
    //****************************************************************//
//    if (self.headerCenterPieceImageView) {
//        [self.headerView insertSubview:faderView atIndex:1];
//    }
//    else {
        [self.headerView insertSubview:faderView atIndex:0];
//    }
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [spinner setFrame:CGRectMake(self.headerView.frame.size.width/2 - spinner.frame.size.width/2,
                                 self.headerView.frame.size.height/2 - spinner.frame.size.height/2,
                                 spinner.frame.size.width,
                                 spinner.frame.size.height)];
    [self.headerView addSubview:spinner];
    [spinner startAnimating];
}

@end
