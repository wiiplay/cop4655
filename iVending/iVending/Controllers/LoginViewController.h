//
//  LoginViewController.h
//  iVending
//
//  Created by Manuel Pino on 4/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavigationViewController.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) MainNavigationViewController *navController;
- (IBAction)login:(id)sender;

@end
