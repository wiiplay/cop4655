//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "Inventory.h"
#import "SqlDB.h"
#import "UserDb.h"

@interface InventoryDb : NSObject

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Inventory *inventory;
@property (strong, nonatomic) User *user;

//get an inventory record from the inventory table by inventory object (businessId, machineId, date)
- (NSMutableDictionary *) getInventoryByDay: (Inventory *) passed andConnection: (SqlDB *) connection;
//insert an inventory record into the inventory table by inventory object (businessId, machineId, date)
- (BOOL) insertInventory: (Inventory *) passed andConnection: (SqlDB *) connection;

@end
