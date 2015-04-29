//
//  EditMachinesViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "EditMachinesViewController.h"

@implementation EditMachinesViewController

@synthesize myDb, business, machine, machineDb, assignedBusiness, description, rows, columns, machineId, performInventory;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myDb = [SqlDB getSqlDB];
    machineDb = [[MachinesDb alloc] init];
    [self loadEditBusiness];
    performInventory.layer.borderWidth = 1;
    performInventory.layer.cornerRadius = 8;
    performInventory.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void) viewDidAppear:(BOOL)animated
{
    myDb = [SqlDB getSqlDB];
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
    machineId.text = [NSString stringWithFormat: @"%@", machine.machineID ];
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
        NSNumber *machineid = machine.machineID;
        machine = nil;
        machine = [[Machines alloc] initWithDescription: description.text andFKBusinessID:business.businessID andRows: [NSNumber numberWithInteger:[rows.text integerValue] ] andColumns: [NSNumber numberWithInteger:[columns.text integerValue] ] ];
        machine.machineID = machineid;
        [machineDb updateMachine:machine andConnection:myDb];
        [self loadEditBusiness];
    }
}

- (IBAction)deleteMachine:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"inventory"]){
        Machines *pass = [Machines getMachine];
        pass.machineID = machine.machineID;
        pass.fk_BusinessID = machine.fk_BusinessID;
    }
}

// if the keyboard is showing and you touch anywhere in the view it will hide the keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [[event allTouches] anyObject];
    if( [description isFirstResponder] && [touch view] != description ){
        [description resignFirstResponder];
    }
    
    if( [rows isFirstResponder] && [touch view] != rows ){
        [rows resignFirstResponder];
    }
    
    if( [columns isFirstResponder] && [touch view] != columns ){
        [columns resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}

//when the return button is pressed it will return focus to the view
- (IBAction)textFieldReturn:(id)sender{
    
    [sender resignFirstResponder];
}












@end
