//
//  MainViewController.m
//  Menu Based Application
//
//  Created by Paul Wilson on 6/15/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "RMSwipeTableViewCell.h"


@interface MainViewController ()

@end

@implementation MainViewController

@synthesize locationPressed, plistFile, allConverters;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    static NSString *CellIdentifier = @"Cell";

    [self.tableView registerClass:[RMSwipeTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.title = self. locationPressed;
    
    //Determine which file to load
    if ([locationPressed isEqualToString:@"All"]) {
        self.plistFile = [[NSBundle mainBundle] pathForResource:@"ConverterInformation" ofType:@"plist"];

    }else if ([locationPressed isEqualToString:@"Favorites"]) {
        self.plistFile = [[NSBundle mainBundle] pathForResource:@"Favorites" ofType:@"plist"];
    }

    //Load in the dictionary from the plist
    self.allConverters = [NSMutableArray arrayWithContentsOfFile:self.plistFile];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray*)allConverters {
    if (!allConverters) {
        allConverters =[NSMutableArray arrayWithContentsOfFile:self.plistFile];
    }
    return allConverters;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return allConverters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = [[allConverters objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    //return cell;
    
    //Implementation of swipe
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.revealDirection = RMSwipeTableViewCellRevealDirectionBoth;
    cell.delegate = self; // optional
    cell.textLabel.text = [[allConverters objectAtIndex:indexPath.row] objectForKey:@"name"];

    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[allConverters objectAtIndex:indexPath.row] objectForKey:@"multitable"]) {
    
    DetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    detailView.selectedIndexPath = indexPath.row;
    detailView.isFavorites = NO;
    detailView.locationPressed = self.locationPressed;
    
    
    [self.navigationController pushViewController:detailView animated:YES];
        
    }
}

@end
