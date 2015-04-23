//
//  EditBusinessViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "EditBusinessViewController.h"

@implementation EditBusinessViewController

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
<<<<<<< HEAD
=======
}

- (void) viewDidAppear:(BOOL)animated
{
    myDb = [sqlDB getSqlDB];
    businessDb = [[BusinessDb alloc]init];
}

- (void) viewDidDisappear:(BOOL)animated
{
>>>>>>> origin/master

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadEditBusiness
{
    businessName.text = business.businessName;
    address.text = business.address;
    address2.text = business.address2;
    city.text = business.city;
    state.text = business.state;
    zip.text = [NSString stringWithFormat:@"%@",  business.zip];
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

- (IBAction)editButton:(id)sender {
    
    UIButton *edit = (UIButton *) sender;
    NSString *text = [edit currentTitle];
    if ( [text isEqualToString: @"Edit"]) {
        [edit setTitle:@"Save" forState:UIControlStateNormal];
        businessName.userInteractionEnabled = YES;
        address.userInteractionEnabled = YES;
        address2.userInteractionEnabled = YES;
        city.userInteractionEnabled = YES;
        state.userInteractionEnabled = YES;
        zip.userInteractionEnabled = YES;
    }
    else if ( [text isEqualToString: @"Save"]){
        [edit setTitle:@"Edit" forState:UIControlStateNormal];
        businessName.userInteractionEnabled = NO;
        address.userInteractionEnabled = NO;
        address2.userInteractionEnabled = NO;
        city.userInteractionEnabled = NO;
        state.userInteractionEnabled = NO;
        zip.userInteractionEnabled = NO;
        [self updateBusinessObject];
        [businessDb updateBusiness: business andProd: myDb ];
        [self loadEditBusiness];
    }
}

- (void) updateBusinessObject
{
    business = nil;
    business = [[Business alloc] initWithName:businessName.text andAddress:address.text andAddress2:address2.text andCity:city.text andStat:state.text andZip: [NSNumber numberWithInteger:[zip.text integerValue]] ];
}


















@end
