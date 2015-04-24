//
//  MachinesTableViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MachinesDb.h"
#import "EditMachinesViewController.h"
#import "VendingContentTableViewController.h"


@interface MachinesTableViewController : UITableViewController

@property (strong, nonatomic)sqlDB *myDb;
@property (strong, nonatomic)Business *business;
@property (strong, nonatomic)Machines *machine;
@property (strong, nonatomic)MachinesDb *machineDb;
@property (strong, nonatomic)NSMutableDictionary *machineList;
@property (strong, nonatomic)NSArray *keys;

@property (strong, nonatomic) UILongPressGestureRecognizer *lpgr;
- (IBAction)backButton:(id)sender;

@end
