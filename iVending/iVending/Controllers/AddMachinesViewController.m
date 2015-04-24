//
//  AddMachinesViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AddMachinesViewController.h"

@implementation AddMachinesViewController

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
    machine = [[Machines alloc] init];
    machineDb = [[MachinesDb alloc] init];
    [self resetAddView];
    assignedBusiness.text = business.businessName;
    assignedBusiness.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear:animated];
    
    myDb = [sqlDB getSqlDB];
    machine = [[Machines alloc] init];
    machineDb = [[MachinesDb alloc] init];
    [self resetAddView];
    assignedBusiness.text = business.businessName;
    assignedBusiness.enabled = NO;    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void) resetAddView{
    assignedBusiness.text = @"";
    description.text = @"";
    rows.text = @"";
    columns.text = @"";
}

- (IBAction)saveBusiness:(id)sender {
    
    machine = [[Machines alloc] initWithDescription: description.text andFKBusinessID:business.businessID andRows: [NSNumber numberWithInteger:[rows.text integerValue] ] andColumns: [NSNumber numberWithInteger:[columns.text integerValue] ] ];
    [machineDb insertMachine: machine andConnection: myDb];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
