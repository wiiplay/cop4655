//
//  Inventory.m
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "Inventory.h"

@implementation Inventory

@synthesize inventoryID, businessID, machineID, inventoryDate, productID, row, column, quantity, userID;

-(instancetype) initWithBusinessID: (NSNumber *) businessId andMachineID: (NSNumber *) machineId andInventoryDate: (NSDate *) date andProductID: (NSNumber *) productId andRow: (NSNumber *) itemRow andColumn: (NSNumber *) itemColumn andQuantity: (NSNumber *) quantityCount andUserID: (NSNumber *) userId
{
    self = [super init];
    if (self) {
        businessID = businessId;
        machineID = machineId;
        inventoryDate = date;
        productID = productId;
        row = itemRow;
        column = itemColumn;
        quantity = quantityCount;
        userID = userId;
    }
    return self;
    
}

@end
