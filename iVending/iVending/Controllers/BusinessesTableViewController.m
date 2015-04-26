//
//  BusinessesTableViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "BusinessesTableViewController.h"

@implementation BusinessesTableViewController

@synthesize lpgr;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear:animated];
        
    myDB = [SqlDB getSqlDB];
    businessDb = [[BusinessDb alloc] init];
    businessList = [businessDb getBusinessList: myDB];
    keys = [businessList allKeys];
    
    lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    
    [self.tableView addGestureRecognizer:self.lpgr];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return businessList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"businessCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    business = [ businessList objectForKey: [keys objectAtIndex:indexPath.row] ];
    cell.textLabel.text = business.businessName;
    
    return cell;
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    if ( sender.state == UIGestureRecognizerStateEnded) {
        UITableView* tableView = (UITableView*)self.view;
        CGPoint touchPoint = [sender locationInView:self.view];
        NSIndexPath* index = [tableView indexPathForRowAtPoint: touchPoint];
        if (index != nil) {
            business = [ businessList objectForKey: [keys objectAtIndex: index.row] ];
        }

        [self performSegueWithIdentifier:@"editBusiness" sender:self];
    }
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"editBusiness"]){
        EditBusinessViewController *vc = (EditBusinessViewController*)segue.destinationViewController;
        vc.business = business;
    }
    if([segue.identifier isEqualToString:@"machines"]){
        MachinesTableViewController *vc = (MachinesTableViewController*)segue.destinationViewController;
        
        UITableViewCell *senderButton = (UITableViewCell *)sender;
        UITableView * table = self.tableView;
        NSIndexPath* index = [table indexPathForCell:senderButton];
        if (index != nil) {
            business = [ businessList objectForKey: [keys objectAtIndex: index.row] ];
        }
        
        vc.business = business;
    }
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}












@end












