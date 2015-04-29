//
//  EditBusinessViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "EditBusinessViewController.h"

@implementation EditBusinessViewController

@synthesize myDb, business, businessDb, businessName, address, address2, city, state, zip,businessId;

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
}

- (void) viewDidAppear:(BOOL)animated
{
    myDb = [SqlDB getSqlDB];
    businessDb = [[BusinessDb alloc]init];
    [self loadEditBusiness];
}

- (void) viewDidDisappear:(BOOL)animated
{

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
    businessId.text = [NSString stringWithFormat:@"%@",  business.businessID];
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
    UIBarButtonItem *edit = (UIBarButtonItem *) sender;
    NSString *text = [edit title];
    if ( [text isEqualToString: @"Edit"]) {
        [edit setTitle:@"Save"];
        businessName.enabled = YES;
        address.enabled = YES;
        address2.enabled = YES;
        city.enabled = YES;
        state.enabled = YES;
        zip.enabled = YES;
    }
    else if ( [text isEqualToString: @"Save"]){
        [edit setTitle:@"Edit"];
        businessName.enabled = NO;
        address.enabled = NO;
        address2.enabled = NO;
        city.enabled = NO;
        state.enabled = NO;
        zip.enabled = NO;
        NSNumber *businessid = business.businessID;
        business = nil;
        business = [[Business alloc] initWithName:businessName.text andAddress:address.text andAddress2:address2.text andCity:city.text andStat:state.text andZip: [NSNumber numberWithInteger:[zip.text integerValue]] ];
        business.businessID = businessid;
        [businessDb updateBusiness: business andProd: myDb ];
        [self loadEditBusiness];
    }
}

- (IBAction)deleteBusiness:(id)sender {
}

// if the keyboard is showing and you touch anywhere in the view it will hide the keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [[event allTouches] anyObject];
    if( [businessName isFirstResponder] && [touch view] != businessName ){
        [businessName resignFirstResponder];
    }
    
    if( [address isFirstResponder] && [touch view] != address ){
        [address resignFirstResponder];
    }
    
    if( [address2 isFirstResponder] && [touch view] != address2 ){
        [address2 resignFirstResponder];
    }
    
    if( [city isFirstResponder] && [touch view] != city ){
        [city resignFirstResponder];
    }
    
    if( [state isFirstResponder] && [touch view] != state ){
        [state resignFirstResponder];
    }
    
    if( [zip isFirstResponder] && [touch view] != zip ){
        [zip resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}

//when the return button is pressed it will return focus to the view
- (IBAction)textFieldReturn:(id)sender{
    
    [sender resignFirstResponder];
}

















@end
