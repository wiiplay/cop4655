//
//  TakeInventoryTableViewController.h
//  iVending
//
//  Created by Manuel Pino on 4/25/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VendingContentDb.h"
#import "ProductDb.h"

@interface TakeInventoryTableViewController : UITableViewController

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) ProductDb *productDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) MachinesDb *machineDb;
@property (strong, nonatomic) VendingContent *content;
@property (strong, nonatomic) VendingContentDb *contentDb;
@property (strong, nonatomic) NSMutableDictionary *contentList;
@property (strong, nonatomic) NSArray *keys;

@end
