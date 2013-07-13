//
//  MedicalInfoViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MedicalInfoViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "MedicalDetailViewController.h"

@interface MedicalInfoViewController ()

@end

@implementation MedicalInfoViewController

@synthesize medicalInformation;
@synthesize keyPairs, defaultKeys, options;


- (void)viewDidLoad
{
    
    //Setup Navigation Bar and BG
    self.navigationController.navigationBar.tintColor = [UIColor darkTextColor];
    self.title = @"Medical";
    UIImageView * background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableBackground.jpg"]];
    self.tableView.backgroundView = background;
    
    //Implement NSUserDefaults
    //Get the default information
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    //Get the keys and objects from the default settings
    options = [[NSDictionary alloc] init];
    options = [defaults dictionaryRepresentation];
    
    keyPairs = [[NSDictionary alloc]init];
    keyPairs = [options objectForKey:@"medicalInformation"];
    
    
    //Make an array of all of the keys
    medicalInformation = [[NSMutableArray alloc]init];
    for (NSString *key in keyPairs){
        [medicalInformation addObject:key];
    }
    medicalInformation = [self reoganizeMedicalArray:medicalInformation];



    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    //medicalInformation = [[NSMutableArray alloc] initWithObjects:@"First Name", @"Last Name", @"Birthdate", @"Medication Allergies",@"Food Allergies", @"Chronic Conditions",@"Hospitalizations", @"Doctor Information",@"Hospital Preference", @"Medical Insurance", @"Past Surgical Information", nil];
    
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [super viewDidLoad];
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
    return medicalInformation.count + 1;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Medical Information";
    
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

    if (indexPath.row ==[medicalInformation count]){
        cell.textLabel.text = @"Add new row";
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.highlightedTextColor = [UIColor darkGrayColor];
        
    }else{
    

        cell.textLabel.text = [medicalInformation objectAtIndex:indexPath.row];
        cell.textLabel.highlightedTextColor = [UIColor blackColor];
    }
    ((CustomCellBackground *) cell.backgroundView).lastCell = indexPath.row == medicalInformation.count - 1;
    ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == medicalInformation.count - 1;
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    
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


// Override to support conditional editing of the table view.
/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >=[medicalInformation count]){
        return YES;
    
    }
    // Return NO if you do not want the specified item to be editable.
    return NO;
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
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *indexPathArray = [NSArray arrayWithObject:indexPath];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [prefs removeObjectForKey:[medicalInformation objectAtIndex:indexPath.row]];
        
        [medicalInformation removeObjectAtIndex:indexPath.row];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        NSString *theObjectToInsert = @"Other";
        [medicalInformation addObject:theObjectToInsert];
        
        [prefs setObject:@"" forKey:theObjectToInsert];
        [tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
        /*
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         [medicalInformation addObject:messageField.text];
         [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
         */
    }
    [tableView reloadData];
    [prefs synchronize];
    NSLog(@"All contents of NSUserDefaults: %@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.medicalInformation count]){
    
        //put table in edit mode
        [self setEditing:YES animated:YES];
        
    }else{
    
        //Handle normal selections
        MedicalDetailViewController *mdvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MedicalDetail"];
        mdvc.medicalOption = [medicalInformation objectAtIndex:indexPath.row];
        mdvc.isTextView = NO;
        mdvc.isTextBox = NO;
        mdvc.isPicker = NO;
        
        if([[medicalInformation objectAtIndex:indexPath.row] isEqual:@"Name"]){
            
            mdvc.isTextBox = YES;
            
        } else if([[medicalInformation objectAtIndex:indexPath.row] isEqual:@"Birth Date"]){
            mdvc.isPicker = YES;
            
        } else{
            mdvc.isTextView = YES;
        }
        
        
        [self.navigationController pushViewController:mdvc animated:YES];
    
}
}

#pragma mark - Table View Editting

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{

    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.editing) {
        if (indexPath.row == [self.medicalInformation count]) {
            return UITableViewCellEditingStyleInsert;
        }else {
            return UITableViewCellEditingStyleDelete;
        }
    }
    return UITableViewCellEditingStyleNone;
}


-(NSMutableArray *)reoganizeMedicalArray:(NSMutableArray *)array{
    
    NSUInteger pos;
    id object;
    for(NSUInteger x = 0; x < [array count]; x++){
        
        switch (x) {
            case 0:
                
                
                
                pos = [array indexOfObject:@"First Name"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:0];
                break;
            case 1:
                pos = [array indexOfObject:@"Last Name"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:1];
                
                break;
            case 2:
                pos = [array indexOfObject:@"Birthdate"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:2];
                break;
                
            default:
                break;
        }
        
        
    }
    
    
    return  array;
}

@end
