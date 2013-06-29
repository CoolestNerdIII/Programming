//
//  MenuViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 6/29/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize emergencyList;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view
     numberOfItemsInSection:(NSInteger)section {
    NSString *searchTerm = self.searches[section];
    return [self.searchResults[searchTerm] count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView {
    return [self.searches count];
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [cv
                                  dequeueReusableCellWithReuseIdentifier:@"FlickrCell "
                                  forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView
 viewForSupplementaryElementOfKind:(NSString *)kind
 atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/


@end
