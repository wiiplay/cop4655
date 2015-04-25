//
//  BusinessesTableViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestData.h"
#import "EditBusinessViewController.h"
#import "MachinesTableViewController.h"

@interface BusinessesTableViewController : UITableViewController{
    SqlDB *myDB;
    TestData *getTestData;
    NSMutableDictionary *businessList;
    BusinessDb * businessDb;
    Business *business;
    NSArray *keys;
}

@property (nonatomic,strong) UILongPressGestureRecognizer *lpgr;
- (IBAction)backButton:(id)sender;

@end
