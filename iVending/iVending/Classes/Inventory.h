//
//  Inventory.h
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Inventory : NSObject

@property (strong, nonatomic) NSNumber * inventoryID;
@property (strong, nonatomic) NSNumber * businessID;
@property (strong, nonatomic) NSNumber * machineID;
@property (strong, nonatomic) NSDate * inventoryDate;
@property (strong, nonatomic) NSNumber * productID;
@property (strong, nonatomic) NSNumber * row;
@property (strong, nonatomic) NSNumber * column;
@property (strong, nonatomic) NSNumber * quantity;
@property (strong, nonatomic) NSNumber * userID;

-(instancetype) initWithBusinessID: (NSNumber *) businessId andMachineID: (NSNumber *) machineId andInventoryDate: (NSDate *) date andProductID: (NSNumber *) productId andRow: (NSNumber *) itemRow andColumn: (NSNumber *) itemColumn andQuantity: (NSNumber *) quantityCount andUserID: (NSNumber *) userId;

@end
