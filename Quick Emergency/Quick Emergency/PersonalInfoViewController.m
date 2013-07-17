//
//  PersonalInfoViewController.m
//  Quick Emergency
//
//  Created by Paul Wilson on 7/7/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "CustomFooter.h"

@interface PersonalInfoViewController ()

@end

@implementation PersonalInfoViewController

@synthesize primaryInformation, addressInformation;
@synthesize personalInformation, titles, defaultKeys;
@synthesize keyPairs, options;

- (void)viewDidLoad
{
    //[super viewDidLoad];

    //primaryInformation = [[NSArray alloc] initWithObjects:@"First Name", @"Last Name", @"Age", @"Gender", @"Home Phone", @"Cell Phone", nil];
    
    //addressInformation = [[NSArray alloc] initWithObjects:@"Street Line 1", @"Street Line 2", @"City", @"State", @"Zipcode", @"Country",  nil];
    
    //Implement NSUserDefaults
    //Get the default information
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    //Get the keys and objects from the default settings
    options = [[NSDictionary alloc] init];
    options = [defaults dictionaryRepresentation];
    
    keyPairs = [[NSDictionary alloc]init];
    keyPairs = [options objectForKey:@"personalInformation"];

    
    //Make an array of all of the keys
    defaultKeys = [[NSMutableArray alloc]init];
    for (NSString *key in keyPairs){
        [defaultKeys addObject:key];
    }
    
    defaultKeys = [self reoganizePersonalArray:defaultKeys];

    
    //Setup Navigation Bar and BG
    self.title = @"Personal";
    
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
    return [keyPairs count];
     
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"User Information";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
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
  
    NSString *key = [defaultKeys objectAtIndex:indexPath.row];
    
    cell.textLabel.text = key;
    
    if([[keyPairs objectForKey:key] isKindOfClass:[NSString class]]){
        cell.detailTextLabel.text = [keyPairs objectForKey:key];

    }else{
        cell.detailTextLabel.text = @"";
    }
    
    
    ((CustomCellBackground *) cell.backgroundView).lastCell = indexPath.row == keyPairs.count - 1;
    ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = indexPath.row == keyPairs.count - 1;
    
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



#pragma mark - Get User Defaults

-(NSMutableArray *)getDefaults:(NSMutableArray *)array withDefaults:(NSUserDefaults*) defaults{
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [array addObject:[defaults stringForKey:@"First Name"]];
    [array addObject:[defaults stringForKey:@"Last Name"]];
    [array addObject:[defaults stringForKey:@"Age"]];
    [array addObject:[defaults stringForKey:@"Gender"]];
    [array addObject:[defaults stringForKey:@"Home Phone"]];
    [array addObject:[defaults stringForKey:@"Cell Phone"]];
    [array addObject:[defaults stringForKey:@"Birthdate"]];
    [array addObject:[defaults arrayForKey:@"address"]];
    
    return array;

}

-(NSMutableArray *)reoganizePersonalArray:(NSMutableArray *)array{
    
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
                pos = [array indexOfObject:@"Age"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:2];
                break;
            case 3:
                pos = [array indexOfObject:@"Gender"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:3];
                break;
            case 4:
                pos = [array indexOfObject:@"Home Phone"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:4];
                break;
            case 5:
                pos = [array indexOfObject:@"Cell Phone"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:5];
                break;
            case 6:
                pos = [array indexOfObject:@"Birthdate"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:6];
                break;
            case 7:
                pos = [array indexOfObject:@"Address"];
                
                object = [array objectAtIndex:pos];
                [array removeObjectAtIndex:pos];
                [array insertObject:object atIndex:7];
                break;
                
            default:
                break;
        }
        
        
    }
    
    
    return  array;
}




@end
