//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "MachinesDb.h"

@implementation MachinesDb

@synthesize vendingMachine;

//Extract a vending machine record from the databased by its ID
- (Machines *) getMachineByID: (Machines *) passed andConnection: (SqlDB *) connection
{
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM machines WHERE machineID = %d", [passed.machineID intValue] ];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                
                NSNumber *machineId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                NSNumber *businessId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 1)];
                NSString *description= [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                
                NSNumber *rows = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 3)];
                NSNumber *columns = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 4)];
                
                vendingMachine = [[Machines alloc] initWithDescription:description andFKBusinessID:businessId andRows:rows andColumns:columns];
                vendingMachine.machineID = machineId;
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return vendingMachine;
}

//Extract all vending machine records for a specific business ID
- (NSMutableDictionary *) getMachineList: (Business *) passed andConnection: (SqlDB *) connection
{
    NSMutableDictionary * machineDictionary = [[NSMutableDictionary alloc] init];
    
    sqlite3 *vendingDB;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM machines WHERE business_ID = %d ORDER BY description DESC", [passed.businessID intValue]];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
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

//allow you to insert a vending machine record into the machines database
- (BOOL) insertMachine: (Machines *) machine andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO machines VALUES (null, %d,'%@',%d,%d)", [machine.fk_BusinessID intValue], machine.description, [machine.numOfRows intValue], [machine.numOfColumns intValue]];
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

//allow you to update a vending machine record from the machines database
- (BOOL) updateMachine: (Machines *) machine andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"UPDATE machines SET description = '%@', numOfRows = %d, numOfColumns = %d WHERE machineID = %d",  machine.description, [machine.numOfRows intValue], [machine.numOfColumns intValue], [machine.machineID intValue] ];
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

//allow you to delete a vending machine record from the machines database
- (BOOL) deleteMachine: (Machines *) machine andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM machines WHERE machineID = %d", [machine.machineID intValue] ];
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
