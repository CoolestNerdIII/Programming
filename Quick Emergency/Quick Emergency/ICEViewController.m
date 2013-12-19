//
//  ICEViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "ICEViewController.h"
#import "ICEDetailViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "CustomFooter.h"


@interface ICEViewController ()

@end

@implementation ICEViewController

@synthesize contacts, doctors, familyMembers, otherContacts;

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //doctors = [[NSMutableArray alloc] initWithObjects:@"Doctor1", @"Doctor2", nil];
    //familyMembers = [[NSMutableArray alloc] initWithObjects:@"Family Member 1", @"Family Member 2", nil];
    //otherContacts = [[NSMutableArray alloc] initWithObjects:@"Other 1", @"Other2", nil];

    
    //doctors = [[NSMutableArray alloc] init];
    familyMembers = [[NSMutableArray alloc] init];
    otherContacts = [[NSMutableArray alloc] init];
    
    
    //contacts = [[NSMutableDictionary alloc] init];
    
    NSDictionary *person1 = @{@"firstName":@"Bob1", @"lastName": @"Marley", @"number": @"1234567890"};
    NSDictionary *person2 = @{@"firstName":@"Bob2", @"lastName": @"Marley", @"number": @"1234567890"};
    NSDictionary *person3 = @{@"firstName":@"Bob3", @"lastName": @"Marley", @"number": @"1234567890"};

    //contacts = [person1 mutableCopy];
    //contacts = [person2 mutableCopy];
    //contacts = [person3 mutableCopy];
    
    //[doctors addObject:person1]; [doctors addObject:person2]; [doctors addObject:person3];
    [familyMembers addObject:person1]; [familyMembers addObject:person2]; [familyMembers addObject:person3];
    [otherContacts addObject:person1]; [otherContacts addObject:person2]; [otherContacts addObject:person3];
    
    //Set Background
    if ([[UIScreen mainScreen] bounds].size.height == 568)
    {
        UIImageView * background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DarkBackground-568@2x.png"]];
        self.tableView.backgroundView = background;
    }else
    {
        UIImageView * background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DarkBackground.png"]];
        self.tableView.backgroundView = background;
    }
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0)
    {
        return  [familyMembers count]+1;
    }
    else
    {
        return [otherContacts count]+1;
    }
    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Family Member(s)";
    }else{
        return @"Other Contacts";
    }
    
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


    
    if (indexPath.section == 0) {
        if (indexPath.row == [self.familyMembers count]) {
            cell.textLabel.text = @"Add new row";
            cell.textLabel.textColor = [UIColor darkGrayColor];
        }else{
        NSMutableDictionary *retval = [familyMembers objectAtIndex:indexPath.row];
        cell.textLabel.text = [retval objectForKey:@"firstName"];
        //cell.textLabel.text = [familyMembers objectAtIndex:indexPath.row];
        
        cell.textLabel.highlightedTextColor = [UIColor blackColor];
        
        ((CustomCellBackground *) cell.backgroundView).lastCell = indexPath.row == familyMembers.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == familyMembers.count - 1;
        
            //cell.textLabel.backgroundColor = [UIColor clearColor];
        }

        
    }
    else
    {
        if (indexPath.row == [self.otherContacts count]) {
            cell.textLabel.text = @"Add new row";
            cell.textLabel.textColor = [UIColor darkGrayColor];
        }else
        {
        NSMutableDictionary *retval = [otherContacts objectAtIndex:indexPath.row];
        cell.textLabel.text = [retval objectForKey:@"firstName"];
        //cell.textLabel.text = [otherContacts objectAtIndex:indexPath.row];
        
        
        ((CustomCellBackground *) cell.backgroundView).lastCell = indexPath.row == otherContacts.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == otherContacts.count - 1;
        }

    }
    
    cell.textLabel.highlightedTextColor = [UIColor blackColor];

    cell.textLabel.backgroundColor = [UIColor clearColor];

    
    
    return cell;
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


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Reuse out of visible range cell if available
    static NSString *CELL_ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    UITextField *inputField;
    if(cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        inputField = [[UITextField alloc] initWithFrame:CGRectMake(120,12,185,30)];
        inputField.adjustsFontSizeToFitWidth = YES;
        inputField.textColor = [self deepBlueColor];
        [cell addSubview:inputField];
    }
    inputField.keyboardType = UIKeyboardTypeDefault;
    switch([indexPath row])
    {
        case 0:
            cell.textLabel.text = @"First Name";
            inputField.placeholder = @"Terrence";
            break;
        case 1:
            cell.textLabel.text = @"Last Name";
            inputField.placeholder = @"Tee";
            break;
    }
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
/*
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

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if (indexPath.section == 0)
        {
            
            // Delete the row from the data source
            [prefs removeObjectForKey:[familyMembers objectAtIndex:indexPath.row]];
            
            //Remove object from array
            [familyMembers removeObjectAtIndex:indexPath.row];
            
            //Remove object from table
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            [tableView reloadData];
        }
        else if (indexPath.section == 1)
        {
            // Delete the row from the data source
            [prefs removeObjectForKey:[otherContacts objectAtIndex:indexPath.row]];
            
            //Remove object from array
            [otherContacts removeObjectAtIndex:indexPath.row];
            
            //Remove object from table
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            [tableView reloadData];
        }
        
        [prefs synchronize];
    }
}
    


-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    if (editing == YES) {
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject)];
        
        //Show add button if in edit mode
        self.navigationItem.leftBarButtonItem = addButton;
        
    }
    else
    {
        //Show normal navigation button if not in edit mode
        self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;
    }
    
}

-(void) insertNewObject
{
    //Display UIAlertView
    
    //UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Add Contact" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add to Family", @"Add to Other",nil];
    //alert.message = @"\n";
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Add Contact" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add to Family",nil];

    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.editing) {
        if (indexPath.section == 0)
        {
            if (indexPath.row == [self.familyMembers count])
            {
                //return UITableViewCellEditingStyleInsert;
                [self insertNewObject];
                return UITableViewCellEditingStyleInsert;
                
            }
            
            else
            {
                return UITableViewCellEditingStyleDelete;
            }
        }
        else if (indexPath.section == 1)
        {
            if (indexPath.row == [self.otherContacts count]) {
                return UITableViewCellEditingStyleInsert;
            }
            else
            {
                return UITableViewCellEditingStyleDelete;
            }
        }
        
    }
    return UITableViewCellEditingStyleNone;
}


#pragma mark - Return keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)tf
{
    [tf endEditing:YES];
    return NO;
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Only do the following actions if the user hit the OK button
    if (buttonIndex == 1)
    {
        //Get the current user preferences
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        //Store the user text in a temporary string
        NSString * tempTextField = [alertView textFieldAtIndex:0].text;
        
        //Create array if array is not already created (precaution)
        if (!familyMembers) {
            familyMembers = [[NSMutableArray alloc]init];
        }
        
        //Add string to the array
        [familyMembers insertObject:tempTextField atIndex:0];
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        //Update array in the NSUserDefaults
        [prefs setObject:familyMembers forKey:@"iceInformation"];
        
        //Update the table with the new data
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        //Reload table and sync NSUserDefaults
        [self.tableView reloadData];
        [prefs synchronize];
    }/*
    else if (buttonIndex == 2)
    {
        
        //Get the current user preferences
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        //Store the user text in a temporary string
        NSString * tempTextField = [alertView textFieldAtIndex:0].text;
        
        //Create array if array is not already created (precaution)
        if (!otherContacts) {
            otherContacts = [[NSMutableArray alloc]init];
        }
        
        //Add string to the array
        [otherContacts insertObject:tempTextField atIndex:0];
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
        
        //Update array in the NSUserDefaults
        [prefs setObject:otherContacts forKey:@"medicalInformation"];
        
        //Update the table with the new data
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        //Reload table and sync NSUserDefaults
        [self.tableView reloadData];
        [prefs synchronize];
    
    }
    */
}


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

    ICEDetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ICEDetailViewController"];
    
    if (indexPath.section == 0) {
        if (indexPath.row == [self.familyMembers count]){
            
            //put table in edit mode
            [self setEditing:YES animated:YES];
            
        }
        else{
            dvc.userInfo = [familyMembers objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];

        }

    } else if (indexPath.section == 1){
        if (indexPath.row == [self.otherContacts count]){
            
            //put table in edit mode
            [self setEditing:YES animated:YES];
            
        }
        else{
        
            dvc.userInfo = [otherContacts objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];

        }
    }
    //dvc.userInfo = @"None";

}

@end
