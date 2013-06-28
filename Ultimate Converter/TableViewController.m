//
//  TableViewController.m
//  Ultimate Converter
//
//  Created by Paul Wilson on 6/2/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "TableTwoViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController
@synthesize converterList, converterListSubtitles, variableConverterList;

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
    
    converterList = [[NSArray alloc]initWithObjects: @"Angles", @"Area", @"Bytes", @"Clothing", @"Cooking", @"Currency", @"Density", @"Energy", @"Force", @"Length/Distance", @"Mass/Weight", @"Numbers", @"Power", @"Pressure", @"Speed", @"Temperature", nil];
    variableConverterList = [[NSArray alloc] initWithObjects:@"Area", nil];
    self.title = @"Converters";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Set up the menu
- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.navigationController.parentViewController;
}

- (IBAction)showLeftMenuPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (IBAction)showRightMenuPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
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
    return converterList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Create an NSString object that we can use as the reuse identifier
    static NSString *CellIdentifier = @"Cell";
    static NSString *CellIdentifier2 = @"Cell2";
    
    
    
    //Check to see if we can reuse cell from a row that has just rolled off the screen
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:indexPath];
    
    
    //IF there are no cells to be reused, create a new cell
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    if(cell2 == nil){
        cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier2];
    }
    
    //Set the text attribute to whatever we are currently looking at in our array
    if([[converterList objectAtIndex:indexPath.row] isEqualToString:@""])
    {
        cell2.textLabel.text = [converterList objectAtIndex:indexPath.row];
        cell2.detailTextLabel.text = [converterListSubtitles objectAtIndex:indexPath.row];
        //Set the detail discolsure indicator
        cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell2;
    }
    else
    {
        cell.textLabel.text = [converterList objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [converterListSubtitles objectAtIndex:indexPath.row];
        //Set the detail discolsure indicator
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueToConversion"])
    {
        //Create an instance of our DetailViewController
        DetailViewController * DVC = [[DetailViewController alloc] init];
        
        //Set the DVC to the destinationViewController property of the seque
        DVC = [segue destinationViewController];
        
        //Get the index path
        NSIndexPath * path = [self.tableView indexPathForSelectedRow];
        
        NSString * theConverters = [converterList objectAtIndex:path.row];
        
        DVC.converterNumber = path.row;
        DVC.converterName = theConverters;
    }
    else if([segue.identifier isEqualToString:@"segueToTable"])
    {
        
        //Create an instance of our DetailViewController
        TableTwoViewController * TVC = [[TableTwoViewController alloc] init];
        
        //Set the DVC to the destinationViewController property of the seque
        TVC = [segue destinationViewController];
        
        //Get the index path
        NSIndexPath * path = [self.tableView indexPathForSelectedRow];
        
        NSString * theConverters = [converterList objectAtIndex:path.row];
        
        TVC.converterNumber = path.row;
        TVC.converterName = theConverters;
        
    }
}

@end
