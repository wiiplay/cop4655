//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "Inventory.h"

@implementation Inventory

@synthesize inventoryID, businessID, machineID, inventoryDate, productID, row, column, quantity, userID;

//initialize an Inventory object with its editable properties
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
