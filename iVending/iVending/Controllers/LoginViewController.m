//
//  LoginViewController.m
//  iVending
//
//  Created by Manuel Pino on 4/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize navController;

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

- (IBAction)login:(id)sender {
    navController = [self.storyboard instantiateViewControllerWithIdentifier:@"navController"];
    // OR myViewController *vc = [[myViewController alloc] init];
    
    // any setup code for *vc
    
    //[self.navigationController popToViewController:self animated:YES];
    [self.navigationController pushViewController:navController animated:YES];
}


@end
