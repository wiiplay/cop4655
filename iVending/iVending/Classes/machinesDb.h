//
//  machinesDb.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Machines.h"
#import "Business.h"
#import "sqlDB.h"

@interface MachinesDb : NSObject

@property (strong, nonatomic) Machines *vendingMachine;

- (Machines *) getMachineByID: (NSNumber *) machineId andConnection: (SqlDB *) connection;
- (NSMutableDictionary *) getMachineList: (Business *) business andConnection: (SqlDB *) connection;
- (BOOL) insertMachine: (Machines *) machine andConnection: (SqlDB *) connection;
- (BOOL) deleteMachine: (Machines *) machine andConnection: (SqlDB *) connection;
- (BOOL) updateMachine: (Machines *) machine andConnection: (SqlDB *) connection;

@end
