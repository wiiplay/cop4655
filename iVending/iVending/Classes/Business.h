//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15
/*
  Used to represent a business object containing business information.
 */

#import <Foundation/Foundation.h>

@interface Business : NSObject

@property (strong, nonatomic) NSNumber *businessID;
@property (strong, nonatomic) NSString  *businessName;
@property (strong, nonatomic) NSString  *address;
@property (strong, nonatomic) NSString  *address2;
@property (strong, nonatomic) NSString  *city;
@property (strong, nonatomic) NSString  *state;
@property (strong, nonatomic) NSNumber  *zip;

//Allows you to get a reference to a business satatic object
+(Business *) getBusiness;

//Used to initialize a Business object
- (instancetype) initWithName: (NSString *) nameBusiness andAddress: (NSString *) addressBusiness andAddress2: (NSString *) address2Business andCity: (NSString *) cityBusiness andStat: (NSString *) stateBusines andZip: (NSNumber *) zipBusiness;

@end
