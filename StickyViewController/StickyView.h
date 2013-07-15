//
//  StickyView.h
//  StickyViewController
//
//  Created by Jesus Morales on 7/12/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StickyView : UIView

@property (strong, nonatomic)UIView *headerView;
@property (strong, nonatomic)UIScrollView *contentView;
@property (assign, nonatomic)int headerHeightStuck;

- (id)initWithFrame:(CGRect)frame
         headerView:(UIView *)headerView
        contentView:(UIScrollView *)contentView
  headerHeightStuck:(int)headerHeightStuck;

@end
