//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "VendingContent.h"

@implementation VendingContent

@synthesize machine, product, contentID, fk_MachineID, fk_ProductID, itemRow, itemColumn, quanity, cost;

//initialize a vending machine content item in the vendingMachine table
- (instancetype) initWithMachineFk: (NSNumber *) machineId andProductFk: (NSNumber *) productId andItemRow: (NSNumber *) row andItemColumn: (NSNumber *) column andItemQuantity: (NSNumber *) itemQuantity andCost: (float) itemCost
{
    self = [super init];
    if (self) {
        fk_MachineID = machineId;
        fk_ProductID = productId;
        itemRow = row;
        itemColumn = column;
        quanity = itemQuantity;
        cost = itemCost;
    }
    return self;
}

@end
