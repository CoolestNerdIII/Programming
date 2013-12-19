//
//  ICEDetailViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/9/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "ICEDetailViewController.h"
#import "TFCell.h"
#import "PickerCell.h"

@interface ICEDetailViewController ()

@property(strong,nonatomic) NSArray *order;
@property(strong,nonatomic) NSDictionary *data;
@property(strong,nonatomic)  NSArray *sections;
- (void) save;
@property (strong, nonatomic) UIBarButtonItem *saveButton;
@property (weak, nonatomic) NSString *value;

@end

@implementation ICEDetailViewController
@synthesize order, data, value,sections;
//@synthesize userInfo, keys;

- (void)viewDidLoad
{
    
    // Data.plist code
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"ICEDetail.plist"];
    
    // check to see if Data.plist exists in documents
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        // if not in documents, get property list from main bundle
        plistPath = [[NSBundle mainBundle] pathForResource:@"ICEDetail" ofType:@"plist"];
    }
    
    // read property list into memory as an NSData object
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    // convert static property list into dictionary object
    data = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!data)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    sections = [[NSArray alloc] initWithArray:[data objectForKey:@"sections"]];
    
    //Organize Dictionary
    order = [[NSArray alloc] initWithObjects:@"firstName", @"lastName", @"homePhone", @"cellPhone",@"workPhone" @"street", @"city", @"state", @"country", @"relationship", nil];
    
    [super viewDidLoad];
    
    self.saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                    target:self
                                                                    action:@selector(save)];
    self.navigationItem.rightBarButtonItem = self.saveButton;

    
    
    /*
    
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
     */
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
    return sections.count;
;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [userInfo count];
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *info = [[NSDictionary alloc]initWithDictionary:[sections objectAtIndex:section]];

    return [info objectForKey:@"header"];
}

- (TFCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *info = [[NSDictionary alloc]initWithDictionary:[sections objectAtIndex:indexPath.section]];

    //NSString *CellIdentifier = [info objectForKey:@"type"];
    NSString *CellIdentifier = @"TFCell";

    TFCell *cell = (TFCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    

    
    if(cell == nil){
        cell = [[TFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    value = [info objectForKey:@"value"];
    
    cell.textfield.placeholder = [info objectForKey:@"label"];
    if (![value isEqualToString:@""]) {
        //cell.textfield.text = value;
    }
    
    /*
    
    if(indexPath.section == 0){
        cell.textfield.text = [userInfo objectForKey:@"firstName"];
        
    } else if(indexPath.section == 1){
        cell.textfield.text = [userInfo objectForKey:@"lastName"];
    
    } else if(indexPath.section == 2){
        cell.textfield.text = [userInfo objectForKey:@"number"];
        cell.textfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    } else{
        NSString *key = [keys objectAtIndex:indexPath.row];
        cell.textfield.text = [userInfo objectForKey:key];
    }
     */
    
    
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

- (void)save
{
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"ICEDetail.plist"];
    
    NSMutableArray *objects = [[NSMutableArray alloc]initWithCapacity:[order count]];
    
    
    for (int i = 0; i <= [order count]-1; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow: 0 inSection: i];
        TFCell *cell = (TFCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        
        value = cell.textfield.text;
        if (value == nil) {
            value = @"";
        }
        
        [objects insertObject:value atIndex:i];
    }
    
    
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: objects forKeys:order];
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    // check is plistData exists
    if(plistData)
    {
        // write plistData to our Data.plist file
        [plistData writeToFile:plistPath atomically:YES];
    }
    else
    {
        NSLog(@"Error in saveData: %@", error);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
