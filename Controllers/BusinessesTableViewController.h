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

@interface BusinessesTableViewController : UITableViewController
{
    sqlDB *myDB;
    TestData *getTestData;
    BusinessDb *businessDb;
    NSMutableDictionary *businessList;
    NSArray *namesList;
    MachinesDb *myMachine;
    Machines *tempMachine;
}

@end
