//
//  TempViewController.h
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDb.h"
#import "BusinessDb.h"

@interface TempViewController : UIViewController

@property (nonatomic) sqlDB *myDB;
@property (strong, nonatomic) ProductDb *theProduct;
@property (strong, nonatomic) NSDictionary *myProducts;

@property (strong, nonatomic) BusinessDb *theBusiness;
@property (strong, nonatomic) NSDictionary *businessList;

@end
