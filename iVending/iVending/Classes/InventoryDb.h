//
//  InventoryDb.h
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inventory.h"
#import "SqlDB.h"
#import "UserDb.h"

@interface InventoryDb : NSObject

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Inventory *inventory;
@property (strong, nonatomic) User *user;

@end
