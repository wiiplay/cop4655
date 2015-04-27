//
//  Machines.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Machines : NSObject

@property (strong, nonatomic) NSNumber *machineID;
@property (strong, nonatomic) NSNumber *fk_BusinessID;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSNumber *numOfRows;
@property (strong, nonatomic) NSNumber *numOfColumns;

+(Machines *) getMachine;

- (instancetype) initWithDescription: (NSString *) descriptionMachine andFKBusinessID: (NSNumber *) businessID andRows: (NSNumber *) numberofRows andColumns: (NSNumber *) numberofColumns;

@end
