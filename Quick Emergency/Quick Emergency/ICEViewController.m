//
//  ICEViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "ICEViewController.h"
#import "ICEDetailViewController.h"

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

    
    doctors = [[NSMutableArray alloc] init];
    familyMembers = [[NSMutableArray alloc] init];
    otherContacts = [[NSMutableArray alloc] init];
    
    
    //contacts = [[NSMutableDictionary alloc] init];
    
    NSDictionary *person1 = @{@"firstName":@"Bob1", @"lastName": @"Marley", @"number": @"1234567890"};
    NSDictionary *person2 = @{@"firstName":@"Bob2", @"lastName": @"Marley", @"number": @"1234567890"};
    NSDictionary *person3 = @{@"firstName":@"Bob3", @"lastName": @"Marley", @"number": @"1234567890"};

    //contacts = [person1 mutableCopy];
    //contacts = [person2 mutableCopy];
    //contacts = [person3 mutableCopy];
    
    [doctors addObject:person1]; [doctors addObject:person2]; [doctors addObject:person3];
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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0){
        return [doctors count];
    } else if (section == 1){
        return  [familyMembers count];
    }else {
        return [otherContacts count];
    }
    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Doctor(s)";
    } else if (section == 1) {
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

    
    if (indexPath.section == 0) {
        NSMutableDictionary *retval = [doctors objectAtIndex:indexPath.row];
        cell.textLabel.text = [retval objectForKey:@"firstName"];
        
    } else if (indexPath.section == 1) {
        
        NSMutableDictionary *retval = [familyMembers objectAtIndex:indexPath.row];
        cell.textLabel.text = [retval objectForKey:@"firstName"];
        //cell.textLabel.text = [familyMembers objectAtIndex:indexPath.row];
        
    }else{
        NSMutableDictionary *retval = [otherContacts objectAtIndex:indexPath.row];
        cell.textLabel.text = [retval objectForKey:@"firstName"];
        //cell.textLabel.text = [otherContacts objectAtIndex:indexPath.row];
    }

    
    return cell;
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

    
    ICEDetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ICEDetailViewController"];
    if (indexPath.section == 0) {
        dvc.userInfo = [doctors objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1){
        dvc.userInfo = [familyMembers objectAtIndex:indexPath.row];

    } else if (indexPath.section == 2){
        dvc.userInfo = [otherContacts objectAtIndex:indexPath.row];

    }
    //dvc.userInfo = @"None";
    [self.navigationController pushViewController:dvc animated:YES];

}

@end
