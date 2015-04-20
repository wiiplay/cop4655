//
//  VendingContent.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Machines.h"
#import "Business.h"
#import "Product.h"

@interface VendingContent : NSObject

@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) NSNumber *contentID;
@property (strong, nonatomic) NSNumber *fk_MachineID;
@property (strong, nonatomic) NSNumber *fk_ProductID;
@property (strong, nonatomic) NSNumber *itemRow;
@property (strong, nonatomic) NSNumber *itemColumn;
@property (strong, nonatomic) NSNumber *quanity;
@property (nonatomic) float cost;

- (instancetype) initWithMachineFk: (NSNumber *) machineId andProductFk: (NSNumber *) productId andItemRow: (NSNumber *) row andItemColumn: (NSNumber *) column andItemQuantity: (NSNumber *) itemQuantity andCost: (float) itemCost;

@end
