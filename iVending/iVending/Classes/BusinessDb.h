//
//  Business.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Business.h"
#import "SqlDB.h"

@interface BusinessDb : NSObject

@property (strong, nonatomic) Business *business;

- (BusinessDb *) getBusinessByName: (NSString *) name andDb: (SqlDB *) connection;
- (BusinessDb *) getBusinessByID: (int) businessId andProd: (SqlDB *) connection;
- (NSMutableDictionary *) getBusinessList: (SqlDB *) connection;
- (BOOL) insertBusiness: (Business *) business andProd: (SqlDB *) connection;
- (BOOL) deleteBusiness: (Business *) business andProd: (SqlDB *) connection;
- (BOOL) updateBusiness: (Business *) passed andProd: (SqlDB *) connection;

@end
