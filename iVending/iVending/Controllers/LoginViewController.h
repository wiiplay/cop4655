//
//  LoginViewController.h
//  iVending
//
//  Created by Manuel Pino on 4/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDb.h"
#import "TestData.h"
#import "MainNavigationViewController.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) TestData *getTestData;
@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) UserDb *userDb;

@property (strong, nonatomic) IBOutlet UITextField *userNameText;

@property (strong, nonatomic) IBOutlet UITextField *passwordText;

- (IBAction)login:(id)sender;

@end
