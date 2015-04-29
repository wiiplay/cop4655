//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "InventoryDb.h"

@implementation InventoryDb

@synthesize user, inventory, content, business, businessDb, machine, machineDb;

//get an inventory record from the inventory table by inventory object (businessId, machineId, date)
- (NSMutableDictionary *) getLastInventory: (Machines *) passed andDate: (NSString *) date andConnection: (SqlDB *) connection
{
    NSMutableDictionary *inventoryList = [[NSMutableDictionary alloc] init];
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM inventory"];//WHERE machine_ID = %d AND inventoryDate = '%@'
                               
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSNumber *inventoryId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                NSNumber *businessId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 1)];
                NSNumber *machineId= [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 2)];
                
                NSString *date = [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)];
                
                NSNumber *productId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 4)];
                NSNumber *row = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 5)];
                NSNumber *column = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 6)];
                NSNumber *itemQuanity = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 7)];
                NSNumber *userId = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 8)];
                
                inventory = [[Inventory alloc] initWithBusinessID:businessId andMachineID:machineId andInventoryDate: date andProductID:productId andRow: row andColumn: column andQuantity: itemQuanity andUserID: userId];
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

//insert an inventory record into the inventory table by inventory object (businessId, machineId, date)
- (BOOL) insertInventory: (Inventory *) passed andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO inventory VALUES (null, %d, %d, '%@', %d, %d, %d, %d, %d)", [passed.businessID intValue], [passed.machineID intValue], passed.inventoryDate, [passed.fk_ProductID intValue], [passed.row intValue], [passed.column intValue], [passed.quantity intValue], [passed.userID intValue] ];
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

//Save the conntent in an vending machine when performing an inventory
- (BOOL) saveInventory: (NSMutableDictionary *) contentList andValues: (NSMutableArray *) inventoryValues andConnection: (SqlDB *) connection
{
    BOOL success = NO;
    int counter = 0;
    
    for(id key in contentList){
        content = [contentList objectForKey:key];
        
        user = [User getUser];
        businessDb = [[BusinessDb alloc]init];
        machineDb = [[MachinesDb alloc] init];
        machine = [[Machines alloc] init];
        machine.machineID = content.fk_MachineID;
        
        machine = [machineDb getMachineByID: machine andConnection: connection];
        
        NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
        [dateformate setDateFormat:@"YYYY-MM-dd"];
        NSString *date_String=[dateformate stringFromDate:[NSDate date]];
        
        inventory = [[Inventory alloc] initWithBusinessID: machine.fk_BusinessID andMachineID: content.fk_MachineID andInventoryDate: date_String andProductID: content.fk_ProductID andRow: content.itemRow andColumn: content.itemColumn andQuantity: [inventoryValues objectAtIndex: counter] andUserID: user.userID];
        
        counter++;
        
        success = [self insertInventory: inventory andConnection:connection];
        
        inventory = nil;
        machine = nil;       
    }
    return success;
}


















@end
