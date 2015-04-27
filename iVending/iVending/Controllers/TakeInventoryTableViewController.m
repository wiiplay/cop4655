//
//  TakeInventoryTableViewController.m
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "TakeInventoryTableViewController.h"

@implementation TakeInventoryTableViewController

@synthesize myDb, business, machine, product, productDb, productList, content, contentDb, contentList, contentKeys, inventoryValues, mainTableView;

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    myDb = [SqlDB getSqlDB];
    machine = [Machines getMachine];
    product = [[Product alloc] init];
    productDb = [[ProductDb alloc] init];
    productList = [productDb getProductList:myDb];
    contentDb = [[VendingContentDb alloc]init];
    contentList = [contentDb getContentByMachine:machine andConnection:myDb];
    contentKeys = [contentList allKeys];
    inventoryValues = [[NSMutableArray alloc] init];
    
    for (int i= 0; i < contentList.count; i++) {
        [inventoryValues addObject: [NSNumber numberWithInt:0]];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {

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
    static NSString *simpleTableIdentifier = @"inventory";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    UITextField *valueTextField = nil;
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier];
        valueTextField = [[UITextField alloc] initWithFrame: CGRectMake(500, 9, 185, 30)];
        valueTextField.tag = 100;
        valueTextField.borderStyle = UITextBorderStyleRoundedRect;
        valueTextField.textAlignment = UITextAlignmentCenter;
        [valueTextField addTarget:self action:@selector(valueEntered:) forControlEvents:UIControlEventEditingChanged];
        [cell.contentView addSubview: valueTextField];
    }
    else{
        valueTextField = (UITextField *)[cell.contentView viewWithTag:100];
    }
    
    content = [ contentList objectForKey: [contentKeys objectAtIndex:indexPath.row] ];
    product.productID = content.fk_ProductID;
    product = [ productDb getProductByID:product andConnection:myDb];
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %@ - Column: %@ - %@", content.itemRow , content.itemColumn, product.productName ];
    
    
    return cell;
}

- (void) valueEntered: (UITextField *) sender
{
    UITableViewCell *passedCell = (UITableViewCell *)[[[sender superview] superview] superview];

    NSIndexPath *indexPath = [mainTableView indexPathForCell: passedCell ];
    [inventoryValues replaceObjectAtIndex: indexPath.row withObject: sender.text];
}

/*- (IBAction)saveInventory:(id)sender {
    if (contentList.count != nil) {
        <#statements#>
    }
}*/















@end
