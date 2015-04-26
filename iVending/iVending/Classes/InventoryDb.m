//
//  InventoryDb.m
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "InventoryDb.h"

@implementation InventoryDb

@synthesize myDb, user, inventory;

- (NSMutableDictionary *) getInventoryByDay: (Inventory *) passed andConnection: (SqlDB *) connection
{
    NSMutableDictionary *inventoryList = [[NSMutableDictionary alloc] init];
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM inventory WHERE business_ID = %d AND machine_ID = %d AND inventoryDate = '%@' ", [passed.businessID intValue], [passed.machineID intValue], passed.inventoryDate ];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSNumber *inventoryId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                NSNumber *businessId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 1)];
                NSNumber *machineId= [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 2)];
                
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"dd-MM-yyyy"];
                NSDate *dateFromString = [[NSDate alloc] init];
                dateFromString = [dateFormatter dateFromString: [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ] ];
                
                NSNumber *productId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 4)];
                NSNumber *row = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 5)];
                NSNumber *column = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 6)];
                NSNumber *itemQuanity = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 7)];
                NSNumber *userId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 8)];
                
                inventory = [[Inventory alloc] initWithBusinessID:businessId andMachineID:machineId andInventoryDate: dateFromString andProductID:productId andRow: row andColumn: column andQuantity: itemQuanity andUserID: userId];
                inventory.inventoryID = inventoryId;
                
                [inventoryList setObject: inventory forKey: [NSString stringWithFormat:@"row%d col%d", [row intValue], [column intValue] ]];
                inventory = nil;
            }
            
            //release statement
            sqlite3_finalize(statement);
            
            //close DB connection
            sqlite3_close(vendingDb);
        }
    }
    return inventoryList;
}

- (BOOL) insertInventory: (Inventory *) passed andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO inventory VALUES (null, %d,%d, '%@' ,%d,%d,%d,%d,%d)", [passed.businessID intValue], [passed.machineID intValue], passed.inventoryDate, [passed.productID intValue], [passed.row intValue], [passed.column intValue], [passed.quantity intValue], [passed.userID intValue] ];
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
