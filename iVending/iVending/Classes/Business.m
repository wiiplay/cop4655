//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15
/*
 Used to represent a business object containing business information.
 */

#import "Business.h"

@implementation Business

@synthesize businessName, businessID, address, address2, city, state, zip;

//Allows you to get a reference to a business satatic object
+(Business *) getBusiness{
    static Business *myBusiness;
    
    if (myBusiness == nil) {
        myBusiness = [[Business alloc] init];
    }
    
    return myBusiness;
}

//Allow you to initialize a business object with all of its paramaters that will change
- (instancetype) initWithName: (NSString *) nameBusiness andAddress: (NSString *) addressBusiness andAddress2: (NSString *) address2Business andCity: (NSString *) cityBusiness andStat: (NSString *) stateBusines andZip: (NSNumber *) zipBusiness
{
    self = [super init];
    if (self) {
        businessName = nameBusiness;
        address = addressBusiness;
        address2 = address2Business;
        city = cityBusiness;
        state = stateBusines;
        zip = zipBusiness;
    }
    return self;
}

@end
