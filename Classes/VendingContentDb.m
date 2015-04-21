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

- (VendingContent *) getContentByMachineID: (Machines *) passed andConnection: (sqlDB *) connection
{
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM vendingContent WHERE contentID = %d", (int)passed.machineID];
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
    
    NSMutableDictionary *vendingContentList = [[NSMutableDictionary alloc] init];
    for (Machines *mech in machineList){
        VendingContent *output = [self getContentByMachineID: mech andConnection: myDb];
        NSString *key = mech.description;
        [vendingContentList setObject: output forKey: key];
    }
    
    return vendingContentList;
}

- (BOOL) insertContent: (VendingContent *) passed andConnection: (sqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO vendingContent VALUES (null, %d,%d,%d,%d,%d,%f)", (int)passed.fk_MachineID , (int)passed.fk_ProductID, (int)passed.itemRow, (int)passed.itemColumn, (int)passed.quanity, passed.cost];
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

- (BOOL) deleteContent: (VendingContent *) passed andConnection: (sqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM vendingContent WHERE contentID = %d", (int)passed.contentID];
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
