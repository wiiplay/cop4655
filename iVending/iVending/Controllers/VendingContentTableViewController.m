//
//  VendingContentTableViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "VendingContentTableViewController.h"

@implementation VendingContentTableViewController

@synthesize myDb, business, product, productDb, machine, machineDb, content, contentDb, contentList, keys;

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
    myDb = [SqlDB getSqlDB];
    product = [[Product alloc]init];
    productDb = [[ProductDb alloc]init];
    contentDb = [[VendingContentDb alloc] init];
    contentList = [[NSMutableDictionary alloc] init];
    contentList = [contentDb getContentByMachine: machine andConnection: myDb];
    keys = [contentList allKeys];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear: animated];
    
    myDb = [SqlDB getSqlDB];
    product = [[Product alloc]init];
    productDb = [[ProductDb alloc]init];
    contentDb = [[VendingContentDb alloc] init];
    contentList = [[NSMutableDictionary alloc] init];
    contentList = [contentDb getContentByMachine: machine andConnection: myDb];
    keys = [contentList allKeys];
    
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
    return contentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"contentCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];

    }

    content = [ contentList objectForKey: [keys objectAtIndex:indexPath.row] ];
    product.productID = content.fk_ProductID;
    product = [ productDb getProductByID:product andConnection:myDb];
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %@ - Column: %@ - %@", content.itemRow , content.itemColumn, product.productName ];

    return cell;
}


- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)addContent:(id)sender {
    [self performSegueWithIdentifier:@"addContent" sender:self];
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
    if([segue.identifier isEqualToString:@"editContent"]){
        EditContentViewController *vc = (EditContentViewController*)segue.destinationViewController;
        
        UITableViewCell *senderButton = (UITableViewCell *)sender;
        UITableView * table = self.tableView;
        NSIndexPath* index = [table indexPathForCell:senderButton];
        if (index != nil) {
            content = [ contentList objectForKey: [keys objectAtIndex: index.row] ];
        }
        vc.machine = machine;
        vc.content = content;
    }
    
    if([segue.identifier isEqualToString:@"addContent"]){
        AddContentViewController *vc = (AddContentViewController*)segue.destinationViewController;
        vc.machine = machine;
        vc.content = content;
    }
}


















@end
