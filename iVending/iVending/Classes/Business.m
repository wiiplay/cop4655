//
//  Business.m
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "Business.h"

@implementation Business

@synthesize businessName, businessID, address, address2, city, state, zip;

+(Business *) getBusiness{
    static Business *myBusiness;
    
    if (myBusiness == nil) {
        myBusiness = [[Business alloc] init];
    }
    
    return myBusiness;
}

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
