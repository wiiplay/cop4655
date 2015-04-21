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

- (Machines *) getMachineByID: (NSNumber *) machineId andConnection: (sqlDB *) connection;
- (NSMutableDictionary *) getMachineList: (Business *) business andConnection: (sqlDB *) connection;
- (BOOL) insertMachine: (Machines *) machine andConnection: (sqlDB *) connection;
- (BOOL) deleteMachine: (Machines *) machine andConnection: (sqlDB *) connection;

@end
