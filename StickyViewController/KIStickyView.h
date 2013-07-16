//
//  KIStickyView.h
//  StickyViewController
//
//  Created by Jesus Morales on 7/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "StickyView.h"

@interface KIStickyView : StickyView

@property (strong, readonly, nonatomic)UIButton *leftButton;
@property (strong, readonly, nonatomic)UIButton *rightButton;
@property (strong, nonatomic)UIImageView *headerCenterPieceImageView;
@property (strong, nonatomic)UIImage *backdropImage;

- (id)initWithFrame:(CGRect)frame
         headerView:(UIView *)headerView
        contentView:(UIScrollView *)contentView
  headerHeightStuck:(int)headerHeightStuck
         leftButton:(UIButton *)leftButton
        rightButton:(UIButton *)rightButton
headerCenterPieceImageView:(UIImageView *)headerCenterPieceImageView;
- (void)setBackdropImage:(UIImage *)backdropImage;
- (void)setLeftButtonImage:(UIImage *)leftButtonImage;
- (void)setRightButtonImage:(UIImage *)rightButtonImage;
- (void)startTicking;

@end
