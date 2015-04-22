//
//  BusinessesTableViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestData.h"


@interface BusinessesTableViewController : UITableViewController
{
    sqlDB *myDB;
    TestData *getTestData;
}

@end
