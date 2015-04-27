//
//  MainMenuViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "MainMenuViewController.h"

@implementation MainMenuViewController

@synthesize mainToolBar;

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

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated: YES];
    [super viewWillAppear:YES];
    //CGRect screenRect = [[UIScreen mainScreen] bounds];
    //[mainToolBar setFrame: CGRectMake(0, 0, screenRect.size.width, (screenRect.size.height * .30) )];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanQr:(id)sender {
    [self performSegueWithIdentifier:@"scan" sender:self];
}

- (IBAction)searchEdit:(id)sender {
    [self performSegueWithIdentifier:@"businesses" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"scan"]){
        //[self.navigationController popViewControllerAnimated:YES];
    }
    if([segue.identifier isEqualToString:@"businesses"]){
        //[self.navigationController popViewControllerAnimated:YES];
    }

}







@end
