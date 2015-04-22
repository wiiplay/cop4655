//
//  Business.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Business.h"
#import "sqlDB.h"

@interface BusinessDb : NSObject

@property (strong, nonatomic) Business *business;

- (BusinessDb *) getBusinessByName: (NSString *) name andDb: (sqlDB *) connection;
- (BusinessDb *) getBusinessByID: (int) businessId andProd: (sqlDB *) connection;
- (NSMutableDictionary *) getBusinessList: (sqlDB *) connection;
- (BOOL) insertBusiness: (Business *) business andProd: (sqlDB *) connection;
- (BOOL) deleteBusiness: (Business *) business andProd: (sqlDB *) connection;

@end
