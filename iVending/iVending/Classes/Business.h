//
//  Business.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"

@interface Business : NSObject

@property (strong, nonatomic) NSNumber *businessID;
@property (strong, nonatomic) NSString  *businessName;
@property (strong, nonatomic) NSString  *address;
@property (strong, nonatomic) NSString  *address2;
@property (strong, nonatomic) NSString  *city;
@property (strong, nonatomic) NSString  *state;
@property (strong, nonatomic) NSString  *zip;

@end
