//
//  BusinessesTableViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestData.h"
#import "BusinessDb.h"
#import "MachinesDb.h"
#import "ProductDb.h"
#import "VendingContentDb.h"

@interface BusinessesTableViewController : UITableViewController
{
    sqlDB *myDB;
    TestData *getTestData;
    BusinessDb *businessDb;
    NSMutableDictionary *businessList;
    NSArray *namesList;
    MachinesDb *machineDb;
    Machines *machine;
    Product *product;
    ProductDb *productDb;
    VendingContent *content;
    VendingContentDb *contentDb;
}

@end
