//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>

@interface Inventory : NSObject

@property (strong, nonatomic) NSNumber * inventoryID;
@property (strong, nonatomic) NSNumber * businessID;
@property (strong, nonatomic) NSNumber * machineID;
@property (strong, nonatomic) NSDate   * inventoryDate;
@property (strong, nonatomic) NSNumber * productID;
@property (strong, nonatomic) NSNumber * row;
@property (strong, nonatomic) NSNumber * column;
@property (strong, nonatomic) NSNumber * quantity;
@property (strong, nonatomic) NSNumber * userID;

//initialize an Inventory object with its editable properties
-(instancetype) initWithBusinessID: (NSNumber *) businessId andMachineID: (NSNumber *) machineId andInventoryDate: (NSDate *) date andProductID: (NSNumber *) productId andRow: (NSNumber *) itemRow andColumn: (NSNumber *) itemColumn andQuantity: (NSNumber *) quantityCount andUserID: (NSNumber *) userId;

@end
