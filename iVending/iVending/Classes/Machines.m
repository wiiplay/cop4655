//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "Machines.h"

@implementation Machines

@synthesize machineID, fk_BusinessID, description, numOfColumns, numOfRows;

//Get a static reference of the machine class
+(Machines *) getMachine{
    static Machines *myMachine;
    
    if (myMachine == nil) {
        myMachine = [[Machines alloc] init];
    }
    
    return myMachine;
}

//initialize a machine object with all of its editable parameters
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
