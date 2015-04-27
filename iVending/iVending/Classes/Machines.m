//
//  Machines.m
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "Machines.h"

@implementation Machines

@synthesize machineID, fk_BusinessID, description, numOfColumns, numOfRows;

+(Machines *) getMachine{
    static Machines *myMachine;
    
    if (myMachine == nil) {
        myMachine = [[Machines alloc] init];
    }
    
    return myMachine;
}

- (instancetype) initWithDescription: (NSString *) descriptionMachine andFKBusinessID: (NSNumber *) businessID andRows: (NSNumber *) numberofRows andColumns: (NSNumber *) numberofColumns
{
    self = [super init];
    if (self) {
        description = descriptionMachine;
        fk_BusinessID = businessID;
        numOfRows = numberofRows;
        numOfColumns = numberofColumns;
    }
    return self;
}


@end
