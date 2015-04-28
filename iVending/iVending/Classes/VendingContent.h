//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
@class Machines;
@class Business;
@class Product;

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

//initialize a vending machine content item in the vendingMachine table
- (instancetype) initWithMachineFk: (NSNumber *) machineId andProductFk: (NSNumber *) productId andItemRow: (NSNumber *) row andItemColumn: (NSNumber *) column andItemQuantity: (NSNumber *) itemQuantity andCost: (float) itemCost;

@end
