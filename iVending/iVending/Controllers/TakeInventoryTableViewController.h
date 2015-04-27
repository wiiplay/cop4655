//
//  TakeInventoryTableViewController.h
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VendingContentDb.h"
#import "BusinessDB.h"
#import "MachinesDb.h"
#import "ProductDb.h"

@interface TakeInventoryTableViewController : UITableViewController

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) ProductDb *productDb;
@property (strong, nonatomic) NSMutableDictionary *productList;
@property (strong, nonatomic) VendingContent *content;
@property (strong, nonatomic) VendingContentDb *contentDb;
@property (strong, nonatomic) NSMutableDictionary *contentList;
@property (strong, nonatomic) NSArray *contentKeys;
@property (strong, nonatomic) NSMutableArray *inventoryValues;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

- (IBAction)saveInventory:(id)sender;


@end
