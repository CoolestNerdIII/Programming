//
//  DetailViewController.h
//  Menu Based Application
//
//  Created by Paul Wilson on 6/15/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic,assign) NSInteger selectedIndexPath;

@property (nonatomic,assign) BOOL isFavorites;

@property (nonatomic,strong) NSString *locationPressed;

@property (nonatomic,strong) NSArray *converterData;

@property (nonatomic,strong) NSDictionary *theConverter;

@property (nonatomic,strong) UIScrollView *theScrollView;

@end
