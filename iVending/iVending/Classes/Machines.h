//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15


#import <Foundation/Foundation.h>

@interface Machines : NSObject

@property (strong, nonatomic) NSNumber *machineID;
@property (strong, nonatomic) NSNumber *fk_BusinessID;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSNumber *numOfRows;
@property (strong, nonatomic) NSNumber *numOfColumns;

//Singleton of a machine object
+(Machines *) getMachine;

//initialize a machine object with all of its editable parameters
- (instancetype) initWithDescription: (NSString *) descriptionMachine andFKBusinessID: (NSNumber *) businessID andRows: (NSNumber *) numberofRows andColumns: (NSNumber *) numberofColumns;

@end
