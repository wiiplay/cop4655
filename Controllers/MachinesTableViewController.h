//
//  MachinesTableViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MachinesDb.h"
#import "BusinessDb.h"

@interface MachinesTableViewController : UITableViewController
{
    Business *business;
    MachinesDb *machineDb;
    sqlDB *mydb;
    NSMutableDictionary *machineList;
    NSArray *listofMachines;
}

@end
