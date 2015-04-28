//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "SqlDB.h"
#import "MachinesDb.h"
#import "BusinessDb.h"
#import "VendingContent.h"

@interface VendingContentDb : NSObject

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) MachinesDb *machineDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) VendingContent *content;

//get a list of vending machine content item by its corresponding machine ID
- (NSMutableDictionary *) getContentByMachine: (Machines *) passed andConnection: (SqlDB *) connection;
//get a list of all coresponding machines and their vending content by business ID
- (NSMutableDictionary *) getContentListForLocation: (Business *) passed andConnection: (SqlDB *) connection;
//able to insert a new vending machine content item into the vending machine
- (BOOL) insertContent: (VendingContent *) passed andConnection: (SqlDB *) connection;
//able to delete a vending machine content item from the vending machine by its ID
- (BOOL) deleteContent: (VendingContent *) passed andConnection: (SqlDB *) connection;

@end
