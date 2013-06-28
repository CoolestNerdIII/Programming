//
//  CustomCell.h
//  Menu Based Application
//
//  Created by Paul Wilson on 6/15/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMSwipeTableViewCell.h"

@interface CustomCell : RMSwipeTableViewCell


@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIImageView *checkmarkGreyImageView;
@property (nonatomic, strong) UIImageView *checkmarkGreenImageView;
@property (nonatomic, strong) UIImageView *checkmarkProfileImageView;
@property (nonatomic, strong) UIImageView *deleteGreyImageView;
@property (nonatomic, strong) UIImageView *deleteRedImageView;
@property (nonatomic, assign) BOOL isFavourite;

-(void)setThumbnail:(UIImage*)image;
-(void)setFavourite:(BOOL)favourite animated:(BOOL)animated;

@end
