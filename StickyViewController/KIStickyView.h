//
//  KIStickyView.h
//  StickyViewController
//
//  Created by Jesus Morales on 7/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "StickyView.h"

@interface KIStickyView : StickyView

@property (strong, nonatomic)UIButton *leftButton;
@property (strong, nonatomic)UIButton *rightButton;
@property (strong, nonatomic)UIImageView *headerCenterPieceImageView;

- (id)initWithFrame:(CGRect)frame
         headerView:(UIView *)headerView
        contentView:(UIScrollView *)contentView
  headerHeightStuck:(int)headerHeightStuck
         leftButton:(UIButton *)leftButton
        rightButton:(UIButton *)rightButton
headerCenterPieceImageView:(UIImageView *)headerCenterPieceImageView;

@end
