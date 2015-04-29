//
//  InventoryCountTableViewController.m
//  iVending
//
//  Created by Manuel Pino on 4/28/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "InventoryCountTableViewController.h"

@implementation InventoryCountTableViewController

@synthesize myDb, machine, product, productDb, inventory, inventoryDb, restockList, keys, content, contentList, contentDb, contentKeys, sold;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myDb = [SqlDB getSqlDB];
    productDb = [[ProductDb alloc] init];
    inventoryDb = [[InventoryDb alloc] init];
    contentDb = [[VendingContentDb alloc] init];
    
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"YYYY-MM-dd"];
    //NSString *date_String=[dateformate stringFromDate:[NSDate date]];
    
    //contentList = [contentDb getContentByMachine:machine andConnection:myDb];
    contentKeys = [contentList allKeys];
    
    //restockList = [inventoryDb getLastInventory:machine andDate: date_String andConnection: myDb];
    keys = [restockList allKeys];
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
    //return restockList.count;
    return contentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"contentCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    inventory = [ restockList objectForKey: [keys objectAtIndex:indexPath.row] ];
    content = [contentList objectForKey: [contentKeys objectAtIndex: indexPath.row] ];
    
    //int restock = [content.quanity intValue] - [inventory.quantity intValue];
    int restock = [content.quanity intValue] - [[sold objectAtIndex:indexPath.row] intValue];
    
    //product.productID = inventory.fk_ProductID;
    product.productID = content.fk_ProductID;
    product = [ productDb getProductByID: product andConnection:myDb];
    //cell.textLabel.text = [NSString stringWithFormat:@"Row: %@ - Column: %@ - %@                                Restock: %d", inventory.row , inventory.column, product.productName, restock ];
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %@ - Column: %@ - %@                                Restock: %d", content.itemRow , content.itemColumn, product.productName, restock ];
    
    return cell;
}

- (IBAction)doneButon:(id)sender {
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated: NO];
    [navigationController popViewControllerAnimated: NO];
    [navigationController popViewControllerAnimated:YES];
}







@end
