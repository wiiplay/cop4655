//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "BusinessDb.h"
#import "MachinesDb.h"
#import "ProductDb.h"
#import "VendingContentDb.h"
#import "UserDb.h"
#import "InventoryDb.h"

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
    InventoryDb *inventoryDb;
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

//populate the tables with data for testing/demo purposes and view results
- (void) populateData;

@end
