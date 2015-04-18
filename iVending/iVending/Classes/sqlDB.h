//
//  sqlDB.h
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface sqlDB : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *vendingDB;

@property (nonatomic, strong) NSString *documentsDirectory;

+ (sqlDB *) getSqlDB;

@end
