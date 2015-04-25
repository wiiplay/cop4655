//
//  AddMachinesViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MachinesDb.h"
#import "BusinessDb.h"

@interface AddMachinesViewController : UIViewController

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) MachinesDb *machineDb;

@property (strong, nonatomic) IBOutlet UITextField *assignedBusiness;
@property (strong, nonatomic) IBOutlet UITextField *description;
@property (strong, nonatomic) IBOutlet UITextField *rows;
@property (strong, nonatomic) IBOutlet UITextField *columns;
- (IBAction)backButton:(id)sender;

@end
