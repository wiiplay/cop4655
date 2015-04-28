//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "Machines.h"
#import "Business.h"
#import "sqlDB.h"

@interface MachinesDb : NSObject

@property (strong, nonatomic) Machines *vendingMachine;

//Extract a vending machine record from the databased by its ID
- (Machines *) getMachineByID: (Machines *) machine andConnection: (SqlDB *) connection;
//Extract all vending machine records for a specific business ID
- (NSMutableDictionary *) getMachineList: (Business *) business andConnection: (SqlDB *) connection;
//allow you to insert a vending machine record into the machines database
- (BOOL) insertMachine: (Machines *) machine andConnection: (SqlDB *) connection;
//allow you to delete a vending machine record from the machines database
- (BOOL) deleteMachine: (Machines *) machine andConnection: (SqlDB *) connection;
//allow you to update a vending machine record from the machines database
- (BOOL) updateMachine: (Machines *) machine andConnection: (SqlDB *) connection;

@end
