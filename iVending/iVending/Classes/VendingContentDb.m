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

- (NSMutableDictionary *) getContentByMachine: (Machines *) passed andConnection: (sqlDB *) connection
{
    NSMutableDictionary *contentList = [[NSMutableDictionary alloc] init];
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM vendingContent WHERE machine_ID = %d", [passed.machineID intValue]];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSNumber *contentId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                NSNumber *machineId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 1)];
                NSNumber *productId= [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 2)];
                NSNumber *rows = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 3)];
                NSNumber *columns = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 4)];
                NSNumber *itemQuanity = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 5)];
                float itemCost = sqlite3_column_double(statement, 6);
                
                content = [[VendingContent alloc] initWithMachineFk:machineId andProductFk:productId andItemRow:rows andItemColumn:columns andItemQuantity:itemQuanity andCost:itemCost];
                content.contentID = contentId;
                [contentList setObject: content forKey: [NSString stringWithFormat:@"row%d col%d", [rows intValue], [columns intValue] ]];
                content = nil;
            }

        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
        }
    }
    return contentList;
}

- (NSMutableDictionary *) getContentListForLocation: (Business *) passed andConnection: (sqlDB *) connection
{
    machineDb = [[MachinesDb alloc] init];
    NSMutableDictionary *machineList = [[NSMutableDictionary alloc] init];
    machineList = [machineDb getMachineList: passed andConnection: connection];
    NSArray *keys = [machineList allKeys];
    
    NSMutableDictionary *vendingContentList = [[NSMutableDictionary alloc] init];
    for (NSString *mech in keys){
        NSMutableDictionary *output = [self getContentByMachine: [machineList objectForKey: mech] andConnection: connection];
        NSString *key = [NSString stringWithFormat:@"%@ located: %@", passed.businessName, mech.description];
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
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO vendingContent VALUES (null, %d,%d,%d,%d,%d,%f)", [passed.fk_MachineID intValue] , [passed.fk_ProductID intValue], [passed.itemRow intValue], [passed.itemColumn intValue], [passed.quanity intValue], passed.cost];
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
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM vendingContent WHERE contentID = %d", [passed.contentID intValue]];
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
