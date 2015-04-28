//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "VendingContentDb.h"

@implementation VendingContentDb

@synthesize myDb, business, machineDb, machine, content;

//get a list of vending machine content item by its corresponding machine ID
- (NSMutableDictionary *) getContentByMachine: (Machines *) passed andConnection: (SqlDB *) connection
{
    NSMutableDictionary *contentList = [[NSMutableDictionary alloc] init];
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM vendingContent WHERE machine_ID = %d ORDER BY itemColumn, itemRow DESC", [passed.machineID intValue]];
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

//get a list of all coresponding machines and their vending content by business ID
- (NSMutableDictionary *) getContentListForLocation: (Business *) passed andConnection: (SqlDB *) connection
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

//able to insert a new vending machine content item into the vending machine
- (BOOL) insertContent: (VendingContent *) passed andConnection: (SqlDB *) connection
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

//able to delete a vending machine content item from the vending machine by its ID
- (BOOL) deleteContent: (VendingContent *) passed andConnection: (SqlDB *) connection
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
