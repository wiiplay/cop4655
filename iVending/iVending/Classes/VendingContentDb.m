//
//  VendingContentDb.m
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "VendingContentDb.h"

@implementation VendingContentDb

@synthesize myDb, business, machineDb, machine, content;

- (VendingContent *) getContentByID: (VendingContent *) passed andConnection: (sqlDB *) connection
{
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM vendingContent WHERE contentID = %d", (int)passed.contentID];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                
                NSNumber *contentId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                NSNumber *machineId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 1)];
                NSNumber *productId= [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 2)];
                NSNumber *rows = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 3)];
                NSNumber *columns = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 4)];
                NSNumber *itemQuanity = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 5)];
                float itemCost = sqlite3_column_double(statement, 6);
                
                content = [[VendingContent alloc] initWithMachineFk:machineId andProductFk:productId andItemRow:rows andItemColumn:columns andItemQuantity:itemQuanity andCost:itemCost];
                content.contentID = contentId;
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return content;
}

- (NSMutableDictionary *) getContentListForLocation: (Business *) passed andConnection: (sqlDB *) connection
{
    machineDb = [[MachinesDb alloc] init];
    NSMutableDictionary *machineList = [[NSMutableDictionary alloc] init];
    machineList = [machineDb getMachineList: passed andConnection: myDb];
    
    sqlite3 *vendingDB;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM machines WHERE businessID = %d", (int) business.businessID];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSNumber *machineId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                NSNumber *businessId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 1)];
                NSString *description= [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                
                NSNumber *rows = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 3)];
                NSNumber *columns = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 4)];
                
                vendingMachine = [[Machines alloc] initWithDescription:description andFKBusinessID:businessId andRows:rows andColumns:columns];
                vendingMachine.machineID = machineId;
                
                [machineDictionary setObject: vendingMachine forKey: description];
                vendingMachine = nil;
            }
            //release statement
            sqlite3_finalize(statement);
        }
        //close DB connection
        sqlite3_close(vendingDB);
    }
    return machineDictionary;
}

- (BOOL) insertMachine: (Machines *) machine andConnection: (sqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO machines VALUES (null, %d,'%@',%d,%d)", (int)machine.fk_BusinessID , machine.description, (int)machine.numOfRows, (int)machine.numOfColumns];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_exec(vendingDB, query_statement, NULL, NULL, &errMsg) != SQLITE_OK) {
            return NO;
        }
        
        //close DB connection
        sqlite3_close(vendingDB);
    }
    else
        return NO;
    return YES;
}

- (BOOL) deleteMachine: (Machines *) machine andConnection: (sqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM machines WHERE machineID = %d", (int)machine.machineID ];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_exec(vendingDB, query_statement, NULL, NULL, &errMsg) != SQLITE_OK) {
            return NO;
        }
        
        //close DB connection
        sqlite3_close(vendingDB);
    }
    else
        return NO;
    
    return YES;
}


@end
