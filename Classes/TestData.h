//
//  TestData.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"

@interface TestData : NSObject

- (BOOL) insertTestData: (sqlDB *) connection;

@end
