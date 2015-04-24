//
//  EditMachinesViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "EditMachinesViewController.h"

@implementation EditMachinesViewController

@synthesize myDb, business, machine, machineDb, assignedBusiness, description, rows, columns;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myDb = [sqlDB getSqlDB];
    machineDb = [[MachinesDb alloc] init];
    [self loadEditBusiness];
}

- (void) viewDidAppear:(BOOL)animated
{
    myDb = [sqlDB getSqlDB];
    machineDb = [[MachinesDb alloc] init];
    [self loadEditBusiness];
}

- (void) viewDidDisappear:(BOOL)animated
{
    
}

- (void) loadEditBusiness
{
    assignedBusiness.text = business.businessName;
    description.text = machine.description;
    rows.text = [NSString stringWithFormat: @"%@", machine.numOfRows ];
    columns.text = [NSString stringWithFormat: @"%@", machine.numOfColumns ];
}

- (IBAction)editButton:(id)sender {
    UIBarButtonItem *edit = (UIBarButtonItem *) sender;
    NSString *text = [edit title];
    if ( [text isEqualToString: @"Edit"]) {
        [edit setTitle:@"Save"];
        description.enabled = YES;
        rows.enabled = YES;
        columns.enabled = YES;
    }
    else if ( [text isEqualToString: @"Save"]){
        [edit setTitle:@"Edit"];
        description.enabled = NO;
        rows.enabled = NO;
        columns.enabled = NO;
        NSNumber *machineId = machine.machineID;
        machine = nil;
        machine = [[Machines alloc] initWithDescription: description.text andFKBusinessID:business.businessID andRows: [NSNumber numberWithInteger:[rows.text integerValue] ] andColumns: [NSNumber numberWithInteger:[columns.text integerValue] ] ];
        machine.machineID = machineId;
        [machineDb updateMachine:machine andConnection:myDb];
        [self loadEditBusiness];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
