//
//  EditBusinessViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessDb.h"

@interface EditBusinessViewController : UIViewController

@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) BusinessDb *businessDb;
@property (strong, nonatomic) SqlDB *myDb;

@property (strong, nonatomic) IBOutlet UITextField *businessName;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *address2;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *zip;
- (IBAction)editButton:(id)sender;


@end
