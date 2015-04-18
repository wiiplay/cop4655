//
//  sqlDB.m
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "sqlDB.h"

@implementation sqlDB

@synthesize databasePath, vendingDB, documentsDirectory;

+ (sqlDB *) getSqlDB
{
    static sqlDB *mySqlDB;
    
    if ([mySqlDB vendingDB] == nil) {
        mySqlDB = [[sqlDB alloc] initDB];
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

- (void) buildDatabaseStructure
{
    const char *dbpath = [databasePath UTF8String];
    
    //create business table
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE businesses (ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL UNIQUE ON CONFLICT ROLLBACK, address TEXT NOT NULL, address2 TEXT NOT NULL, city TEXT NOT NULL, state TEXT NOT NULL, zip TEXT NOT NULL )";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            [self showUIAlertWithMessage:@"Failed to create business table" andTitle:@"Error"] ;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "CREATE TABLE products (ID   INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT    NOT NULL UNIQUE ON CONFLICT ROLLBACK)";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            [self showUIAlertWithMessage:@"Failed to create products table" andTitle:@"Error"] ;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "PRAGMA foreign_keys = off; CREATE TABLE IF NOT EXISTS machines (machineID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, business_ID NOT NULL REFERENCES businesses (ID), description TEXT NOT NULL, numOfRows INTEGER NOT NULL, numOfColumns INTEGER NOT NULL); PRAGMA foreign_keys = on;";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            [self showUIAlertWithMessage:@"Failed to create machines table" andTitle:@"Error"] ;
        }
        sqlite3_close(vendingDB);
    }
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        const char *sql_stmt = "PRAGMA foreign_keys = off; CREATE TABLE IF NOT EXISTS vendingContent (ID INTEGER PRIMARY KEY NOT NULL, machine_ID INTEGER NOT NULL REFERENCES machines (ID), product INTEGER REFERENCES products (ID) NOT NULL, itemRow INTEGER NOT NULL, itemColumn INTEGER NOT NULL, quantity INTEGER NOT NULL, cost DECIMAL NOT NULL); PRAGMA foreign_keys = on;";
        
        if (sqlite3_exec(vendingDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            [self showUIAlertWithMessage:@"Failed to create vendingContent table" andTitle:@"Error"] ;
        }
        sqlite3_close(vendingDB);
    }

}

- (void) showUIAlertWithMessage: (NSString *) message andTitle: (NSString *) title
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}











@end
