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
#import "InventoryDb.h"
#import "InventoryCountTableViewController.h"

@interface TakeInventoryTableViewController : UITableViewController

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) ProductDb *productDb;
@property (strong, nonatomic) InventoryDb *inventoryDb;
@property (strong, nonatomic) VendingContent *content;
@property (strong, nonatomic) VendingContentDb *contentDb;
@property (strong, nonatomic) NSMutableDictionary *contentList;
@property (strong, nonatomic) NSArray *contentKeys;
@property (strong, nonatomic) NSMutableArray *inventoryValues;

- (IBAction)saveInventory:(id)sender;


@end
