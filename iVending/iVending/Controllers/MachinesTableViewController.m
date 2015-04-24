//
//  MachinesTableViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "MachinesTableViewController.h"

@implementation MachinesTableViewController

@synthesize myDb, business, machine, machineDb, machineList, keys, lpgr;

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    myDb = [sqlDB getSqlDB];
    machineDb = [[MachinesDb alloc] init];
    machineList = [[NSMutableDictionary alloc] init];
    machineList = [machineDb getMachineList: business andConnection:myDb];
    keys = [machineList allKeys];
}

- (void)viewWillAppear:(BOOL)animated {
    
    myDb = [sqlDB getSqlDB];
    machineDb = [[MachinesDb alloc] init];
    machineList = [[NSMutableDictionary alloc] init];
    machineList = [machineDb getMachineList: business andConnection:myDb];
    keys = [machineList allKeys];
    
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear:animated];
    
    lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    
    [self.tableView addGestureRecognizer: self.lpgr];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    if ( sender.state == UIGestureRecognizerStateEnded) {
        UITableView* tableView = (UITableView*)self.view;
        CGPoint touchPoint = [sender locationInView:self.view];
        NSIndexPath* index = [tableView indexPathForRowAtPoint: touchPoint];
        if (index != nil) {
            machine = [ machineList objectForKey: [keys objectAtIndex: index.row] ];
        }
        
        [self performSegueWithIdentifier:@"editMachine" sender:self];
    }
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
    return keys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"machineCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    machine = [ machineList objectForKey: [keys objectAtIndex:indexPath.row] ];
    cell.textLabel.text = [NSString stringWithFormat:@"Located at: %@", machine.description];
    
    return cell;
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)addMachine:(id)sender {
    [self performSegueWithIdentifier:@"addMachine" sender:self];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"editMachine"]){
        EditMachinesViewController *vc = (EditMachinesViewController*)segue.destinationViewController;
        vc.business = business;
        vc.machine = machine;
    }
    
    if([segue.identifier isEqualToString:@"addMachine"]){
        AddMachinesViewController *vc = (AddMachinesViewController*)segue.destinationViewController;
        vc.business = business;
    }
    
    if([segue.identifier isEqualToString:@"content"]){
        VendingContentTableViewController *vc = (VendingContentTableViewController*)segue.destinationViewController;
        vc.business = business;
        
        UITableViewCell *senderButton = (UITableViewCell *)sender;
        //UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
        UITableView * table = self.tableView;
        NSIndexPath* index = [table indexPathForCell:senderButton];
        if (index != nil) {
            machine = [ machineList objectForKey: [keys objectAtIndex: index.row] ];
        }
        
        vc.machine = machine;
    }
}

@end
