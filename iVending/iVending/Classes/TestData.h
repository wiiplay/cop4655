//
//  TestData.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessDb.h"
#import "MachinesDb.h"
#import "ProductDb.h"
#import "VendingContentDb.h"
#import "UserDb.h"

@interface TestData : NSObject
{
    SqlDB *myDB;
    Business *business;
    BusinessDb *businessDb;
    MachinesDb *machineDb;
    Machines *machine;
    Product *product;
    ProductDb *productDb;
    VendingContent *content;
    VendingContentDb *contentDb;
    User *user;
    UserDb *userDb;
    NSArray *productList;
    NSMutableArray *listOfProducts;
    NSMutableArray *businessList;
    NSMutableArray *machineList1;
    NSMutableArray *machineList2;
    NSMutableArray *contentList1;
    NSMutableArray *contentList2;
    NSMutableArray *contentList3;
    NSMutableArray *contentList4;
    NSMutableArray *contentList5;
    NSMutableArray *contentList6;
    NSMutableArray *contentList7;
    NSMutableArray *contentList8;
}

- (void) populateData;

@end
