//
//  ICEDetailViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/9/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "ICEDetailViewController.h"
#import "ICEDetailTableCell.h"

@interface ICEDetailViewController ()

@end

@implementation ICEDetailViewController


@synthesize userInfo, keys;

//Get number of keys
//NSUInteger keyCount = [dictionary count];
 //[[dictionary allKeys] count];


- (void)viewDidLoad
{
        
    keys = [[NSMutableArray alloc]init];
    
    for (id key in userInfo){
        
        if ( [userInfo objectForKey:key] != nil){
            //[userInfo removeObjectForKey:key];
            [keys addObject:key];
        }
    }
    [keys removeObject:@"firstName"];
    [keys removeObject:@"lastName"];
    [keys removeObject:@"number"];
    
    [super viewDidLoad];
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
    return userInfo.count;
;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [userInfo count];
    return 1;
}


- (ICEDetailTableCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    ICEDetailTableCell *cell = (ICEDetailTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //UITextField *inputField = [UITextField alloc];
    
    if(cell == nil){
        cell = [[ICEDetailTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    //inputField.keyboardType = UIKeyboardTypeDefault;
    
    if(indexPath.section == 0){
        cell.cellLabel.text = @"First Name";
        cell.cellTextField.text = [userInfo objectForKey:@"firstName"];
        
    } else if(indexPath.section == 1){
        cell.cellLabel.text = @"Last Name";
        cell.cellTextField.text = [userInfo objectForKey:@"lastName"];
    
    } else if(indexPath.section == 2){
        cell.cellLabel.text = @"Phone Number";
        cell.cellTextField.text = [userInfo objectForKey:@"number"];
        cell.cellTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    } else{
        NSString *key = [keys objectAtIndex:indexPath.row];
        cell.cellLabel.text = key;
        cell.cellTextField.text = [userInfo objectForKey:key];
    }
    
    
    //cell.cellTextField.delegate = self;
    /*

     if (indexPath.section == 0)
     cell.textField.text = self.name;
     if (indexPath.section == 1) {
     cell.textField.text = self.numbers[indexPath.row];
     cell.textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
     }
     cell.textField.delegate = self;
     return cell;
     */
    
    
    return cell;
}


#pragma mark - textfield editing
/*
- (void)textFieldDidEndEditing:(UITextField *)tf {
    // some cell's text field has finished editing; which cell?
    UIView* v = tf;
    do {
        v = v.superview;
    } while (![v isKindOfClass: [UITableViewCell class]]);
    
    ICEDetailTableCell* cell = (ICEDetailTableCell*)v;
    // update data model to match
    NSIndexPath* ip = [self.tableView indexPathForCell:cell];
    
    if (ip.section  == 0){
        [self.userInfo objectForKey:@"firstName"] = cell.cellTextField.text;
    }
    else if (ip.section == 1)
        self.name = cell.textField.text;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
