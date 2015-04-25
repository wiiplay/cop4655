//
//  sqlDB.m
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "SqlDB.h"

@implementation SqlDB

@synthesize databasePath, vendingDB, documentsDirectory;

+ (SqlDB *) getSqlDB
{
    static SqlDB *mySqlDB;
    
    if ([mySqlDB vendingDB] == nil) {
        mySqlDB = [[SqlDB alloc] initDB];
    }
    
    return mySqlDB;
}

-(instancetype) initDB
{
    self = [super init];
    if (self)
    {
        NSArray *dirPaths;
        
        //get the directory
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDirectory = dirPaths[0];
      
        //build the path to the directory
        databasePath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"iVending.db"] ];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if ( [fileManager fileExistsAtPath: databasePath] == NO ) {
            [self buildDatabaseStructure];
        }
    }
    
    return self;
}

- (BOOL) buildDatabaseStructure
{
    BOOL passed = YES;
    const char *dbpath = [databasePath UTF8String];
    
    //create business table
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE businesses (businessID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL UNIQUE ON CONFLICT ROLLBACK, address TEXT NOT NULL, address2 TEXT NOT NULL, city TEXT NOT NULL, state TEXT NOT NULL, zip INTEGER NOT NULL )";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            passed = NO;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE products (productID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL UNIQUE ON CONFLICT ROLLBACK)";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            passed = NO;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE machines (machineID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, business_ID INTEGER NOT NULL REFERENCES businesses (businessID), description TEXT NOT NULL, numOfRows INTEGER NOT NULL, numOfColumns INTEGER NOT NULL)";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            passed = NO;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE vendingContent ( contentID  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, machine_ID INTEGER NOT NULL REFERENCES machines (machineID), product_ID INTEGER REFERENCES products (productID) NOT NULL, itemRow INTEGER NOT NULL, itemColumn INTEGER NOT NULL,  quantity INTEGER NOT NULL, cost DECIMAL NOT NULL )";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            passed = NO;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE users (userID INTEGER PRIMARY KEY NOT NULL, username TEXT UNIQUE ON CONFLICT ROLLBACK, password TEXT NOT NULL)";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            passed = NO;
        }
        sqlite3_close(vendingDB);
    }

    return passed;
}












@end
