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

@end
