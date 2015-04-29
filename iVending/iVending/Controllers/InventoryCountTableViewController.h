//
//  InventoryCountTableViewController.h
//  iVending
//
//  Created by Manuel Pino on 4/28/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDb.h"
#import "InventoryDb.h"

@interface InventoryCountTableViewController : UITableViewController

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) ProductDb *productDb;
@property (strong, nonatomic) Inventory *inventory;
@property (strong, nonatomic) InventoryDb *inventoryDb;
@property (strong, nonatomic) NSMutableDictionary *restockList;
@property (strong, nonatomic) NSArray *keys;
@property (strong, nonatomic) NSArray *sold;

@property (strong, nonatomic) VendingContent *content;
@property (strong, nonatomic) VendingContentDb *contentDb;
@property (strong, nonatomic) NSMutableDictionary *contentList;
@property (strong, nonatomic) NSArray *contentKeys;
- (IBAction)doneButon:(id)sender;

@end
