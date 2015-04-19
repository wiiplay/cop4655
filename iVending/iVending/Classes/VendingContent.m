//
//  VendingContent.m
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "VendingContent.h"

@implementation VendingContent

@synthesize machine, product, contentID, machineID, productID, itemRow, itemColumn, quanity, cost;

- (instancetype) initWithMachineFk: (NSNumber *) machineId andProductFk: (NSNumber *) productId andItemRow: (NSNumber *) row andItemColumn: (NSNumber *) column andItemQuantity: (NSNumber *) itemQuantity andCost: (float) itemCost
{
    self = [super init];
    if (self) {
        machineID = machineId;
        productID = productId;
        itemRow = row;
        itemColumn = column;
        quanity = itemQuantity;
        cost = itemCost;
    }
    return self;
}

@end
