//
//  TakeInventoryTableViewController.m
//  iVending
//
//  Created by Manuel Pino on 4/25/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "TakeInventoryTableViewController.h"

@implementation TakeInventoryTableViewController

@synthesize myDb, business, product, productDb, machine, machineDb, content, contentDb, contentList, keys;

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


@end
