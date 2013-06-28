//
//  DetailViewController.m
//  Menu Based Application
//
//  Created by Paul Wilson on 6/15/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize selectedIndexPath, isFavorites, converterData, theConverter, locationPressed;
@synthesize theScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    if (isFavorites) {
        
    }else{
        NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"ConvertList" ofType:@"plist"];

        
        
    }
    
    self.theScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    self.theScrollView.delegate = self;
    self.theScrollView.showsHorizontalScrollIndicator = NO;
    self.theScrollView.pagingEnabled = YES;
    self.theScrollView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.theScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
