//
//  VendingContentDb.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"
#import "MachinesDb.h"
#import "BusinessDb.h"
#import "VendingContent.h"

@interface VendingContentDb : NSObject

@property (strong, nonatomic) sqlDB *myDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) MachinesDb *machineDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) VendingContent *content;

@end
