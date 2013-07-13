//
//  SettingsViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "SettingsViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "CustomFooter.h"
#import "PersonalInfoViewController.h"
#import "MedicalInfoViewController.h"
#import "ICEViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize settingsOptions, settingsDetailText;


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
    
    settingsOptions = [[NSArray alloc] initWithObjects:@"Personal Information", @"Medical Information", @"In Case of Emergency", nil];
    settingsDetailText = [[NSArray alloc] initWithObjects:@"Name, Gender, Address, etc.",@"Medical History, Allegies, etc.", @"Points of Contact", nil];

    UIImageView * background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableBackground.jpg"]];
    self.tableView.backgroundView = background;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [settingsOptions count];
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Please Complete";
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    //Set Background
    if (![cell.backgroundView isKindOfClass:[CustomCellBackground class]]) {
        CustomCellBackground * backgroundCell = [[CustomCellBackground alloc] init];
        cell.backgroundView = backgroundCell;
        
    }
    
    if (![cell.selectedBackgroundView isKindOfClass:[CustomCellBackground class]]) {
        CustomCellBackground * selectedBackgroundCell = [[CustomCellBackground alloc] init];
        selectedBackgroundCell.selected = YES;
        cell.selectedBackgroundView = selectedBackgroundCell;
    }
    

    cell.textLabel.text = [settingsOptions objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [settingsDetailText objectAtIndex:indexPath.row];
    
    ((CustomCellBackground *) cell.backgroundView).lastCell = indexPath.row == settingsOptions.count - 1;
    ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == settingsOptions.count - 1;
    
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.highlightedTextColor = [UIColor blueColor];
    
    return cell;
}


-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomHeader * header = [[CustomHeader alloc] init];
    header.titleLabel.text = [self tableView: tableView titleForHeaderInSection:section];
    if (section == 1) {
        header.lightColor = [UIColor colorWithRed:147.0/255.0 green:105.0/255.0 blue:216.0/255.0 alpha:1.0];
        header.darkColor = [UIColor colorWithRed:72.0/255.0 green:22.0/255.0 blue:137.0/255.0 alpha:1.0];
    }
    return header;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[CustomFooter alloc] init];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    if ([[settingsOptions objectAtIndex:indexPath.row]  isEqual: @"Personal Information"]) {
        
        PersonalInfoViewController *personalView = [self.storyboard instantiateViewControllerWithIdentifier:@"Personal"];
        [self.navigationController pushViewController:personalView animated:YES];
    }
    
    else if ([[settingsOptions objectAtIndex:indexPath.row]  isEqual: @"Medical Information"]) {
    
        MedicalInfoViewController *medicalView = [self.storyboard instantiateViewControllerWithIdentifier:@"Medical"];
        [self.navigationController pushViewController:medicalView animated:YES];
    }
    
    else if ([[settingsOptions objectAtIndex:indexPath.row]  isEqual: @"In Case of Emergency"]) {
        
        ICEViewController *iceView = [self.storyboard instantiateViewControllerWithIdentifier:@"ICE"];
        [self.navigationController pushViewController:iceView animated:YES];
    }


}

@end
