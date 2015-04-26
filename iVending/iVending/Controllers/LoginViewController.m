//
//  LoginViewController.m
//  iVending
//
//  Created by Manuel Pino on 4/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize getTestData, user, userDb, myDb, userNameText, passwordText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    getTestData = [[TestData alloc] init];
    [getTestData populateData];

    user = [User getUser];
    userDb = [[UserDb alloc] init];
    myDb = [SqlDB getSqlDB];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    userNameText.text = @"";
    passwordText.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    
    User *validate = [[User alloc] initWithUser: userNameText.text andPassword: passwordText.text];
    
    if ( [userDb userExist: validate andConnection: myDb] == NO) {
        UIAlertView *userNotFound = [[UIAlertView alloc] initWithTitle: @"Alert" message:@"The username/password combination is incorrect." delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [userNotFound show];
        passwordText.text = @"";
    }
    else
    {
        User *compare = [userDb getUser:validate andConnection:myDb];
        if ([user validateLogin: validate andCompare: compare]) {
            user.userName = validate.userName;
            [self performSegueWithIdentifier:@"toMenu" sender:self];
        }
        else
        {
            UIAlertView *userNotFound = [[UIAlertView alloc] initWithTitle: @"Alert" message:@"The username/password combination is incorrect." delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [userNotFound show];
            passwordText.text = @"";
        }
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toMenu"]){
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    if([segue.identifier isEqualToString:@"register"]){
        [self.navigationController popViewControllerAnimated:YES];
    }
}












@end
