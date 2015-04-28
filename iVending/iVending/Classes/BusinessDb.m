//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15


#import "BusinessDb.h"

@implementation BusinessDb

@synthesize business;

//allows you to get all of a business content from the business table by a business name
- (Business *) getBusinessByName: (NSString *) name andDb: (SqlDB *) connection
{
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM businesses WHERE name = '%@'", name];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                NSString *businessName = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                NSString *address = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                NSString *address2 = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ];
                NSString *city = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 4)] ];
                NSString *state = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 5)] ];
                NSNumber *zip = [NSNumber numberWithInt: (sqlite3_column_int(statement, 6))];
                business =[[Business alloc] initWithName:businessName andAddress:address andAddress2:address2 andCity:city andStat:state andZip: zip];
                business.businessID = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
            }
        }
        
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return business;
}

//allows you to get all of a business content from the business table by a business ID
- (Business *) getBusinessByID: (Business *) passed andProd: (SqlDB *) connection
{
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM businesses WHERE businessID = %d", [passed.businessID intValue]];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                
                NSString *businessName = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                NSString *address = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                NSString *address2 = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ];
                NSString *city = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 4)] ];
                NSString *state = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 5)] ];
                NSNumber *zip = [NSNumber numberWithInt: (sqlite3_column_int(statement, 6))];
                business =[[Business alloc] initWithName:businessName andAddress:address andAddress2:address2 andCity:city andStat:state andZip:zip];
                business.businessID = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return business;
}

//allows you to get a dictionary of business objects from the business table
- (NSMutableDictionary *) getBusinessList: (SqlDB *) connection
{
    NSMutableDictionary * businessDictionary = [[NSMutableDictionary alloc] init];
    
    sqlite3 *vendingDB;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = @"SELECT * FROM businesses ORDER BY name DESC";
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *businessName = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                NSString *address = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                NSString *address2 = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ];
                NSString *city = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 4)] ];
                NSString *state = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 5)] ];
                NSNumber *zip = [NSNumber numberWithInt: (sqlite3_column_int(statement, 6))];
                business =[[Business alloc] initWithName:businessName andAddress:address andAddress2:address2 andCity:city andStat:state andZip:zip];
                business.businessID = [[NSNumber alloc] initWithInt:sqlite3_column_int(statement, 0)];
                
                [businessDictionary setObject: business forKey: businessName];
            }
            //release statement
            sqlite3_finalize(statement);
        }
        //close DB connection
        sqlite3_close(vendingDB);
    }
    return businessDictionary;
}

// allows you to enter a business into the system by passing a business object
- (BOOL) insertBusiness: (Business *) passed andProd: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO businesses VALUES (null,'%@','%@','%@','%@','%@','%d')", passed.businessName, passed.address, passed.address2, passed.city, passed.state, [passed.zip intValue] ];
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


//allows you to update a business record by passing a bussiness object
- (BOOL) updateBusiness: (Business *) passed andProd: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"UPDATE businesses SET  name = '%@', address = '%@', address2 = '%@', city = '%@', state ='%@', zip = %d WHERE businessID = %d" , passed.businessName, passed.address, passed.address2, passed.city, passed.state, [passed.zip intValue], [passed.businessID intValue] ];
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

//allows you to delete a business record in the business table by passing a bussiness object
- (BOOL) deleteBusiness: (Business *) passed andProd: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM businesses WHERE name = '%@'", passed.businessName ];
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
