//
//  AddBusinessViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AddBusinessViewController.h"

@implementation AddBusinessViewController

@synthesize myDb, business, businessDb, businessName, address, address2, city, state, zip;

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
    business = [[Business alloc] init];
    businessDb = [[BusinessDb alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    myDb = [sqlDB getSqlDB];
    business = [[Business alloc] init];
    businessDb = [[BusinessDb alloc] init];
    [self resetAddView];
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void) resetAddView{
    businessName.text = @"";
    address.text = @"";
    address2.text = @"";
    city.text = @"";
    state.text = @"";
    zip.text = @"";
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

- (IBAction)saveBusiness:(id)sender {
    
    if ( [businessDb getBusinessByName:businessName.text andDb:myDb]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat: @"Business name %@ already exist. The name must be uniqe.", businessName.text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        business = [[Business alloc] initWithName: businessName.text andAddress:address.text andAddress2:address2.text andCity:city.text andStat:state.text andZip:[NSNumber numberWithInteger:[zip.text integerValue]] ];
        [businessDb insertBusiness:business andProd:myDb];
        [self.navigationController popViewControllerAnimated:YES];
    }
}



















@end
