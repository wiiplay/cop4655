//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "Inventory.h"
#import "VendingContentDb.h"
#import "UserDb.h"

@interface InventoryDb : NSObject

@property (strong, nonatomic) Inventory *inventory;
@property (strong, nonatomic) BusinessDb *businessDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) MachinesDb *machineDb;
@property (strong, nonatomic) VendingContent *content;
@property (strong, nonatomic) User *user;

//get an inventory record from the inventory table by inventory object (businessId, machineId, date)
- (NSMutableDictionary *) getLastInventory: (Machines *) passed andDate: (NSString *) date andConnection: (SqlDB *) connection;
//insert an inventory record into the inventory table by inventory object (businessId, machineId, date)
- (BOOL) insertInventory: (Inventory *) passed andConnection: (SqlDB *) connection;

//Save the conntent in an vending machine when performing an inventory
- (BOOL) saveInventory: (NSMutableDictionary *) contentList andValues: (NSMutableArray *) inventoryValues andConnection: (SqlDB *) connection;

@end
