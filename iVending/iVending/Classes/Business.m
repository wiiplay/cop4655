//
//  Business.m
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "Business.h"

@implementation Business

@synthesize businessName, businessID, address, address2, city, state, zip;

- (instancetype) initWithName: (NSString *) nameBusiness andAddress: (NSString *) addressBusiness andAddress2: (NSString *) address2Business andCity: (NSString *) cityBusiness andStat: (NSString *) stateBusines andZip: (NSString *) zipBusiness
{
    self = [super init];
    if (self) {
        businessName = nameBusiness;
        address = addressBusiness;
        address2 = address2Business;
        city = cityBusiness;
        state = stateBusines;
        zip = zipBusiness;
    }
    return self;
}

- (Business *) getBusinessByName: (NSString *) name andDb: (sqlDB *) connection
{
    Business *business;
    
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM businesses WHERE name = '%@'", name];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                businessName = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                address = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                address2 = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ];
                city = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 4)] ];
                state = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 5)] ];
                zip = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 6)] ];
                business = [[Business alloc] initWithName:businessName andAddress:address andAddress2:address2 andCity:city andStat:state andZip:zip];
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

- (Business *) getBusinessByID: (int) businessId andProd: (sqlDB *) connection
{
    Business * business;
    
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM businesses WHERE ID = %d", businessId];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                
                businessName = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                address = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                address2 = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ];
                city = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 4)] ];
                state = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 5)] ];
                zip = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 6)] ];
                business = [[Business alloc] initWithName:businessName andAddress:address andAddress2:address2 andCity:city andStat:state andZip:zip];
                business.businessID = [[NSNumber alloc] initWithInt: businessId];
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return business;
}

- (NSMutableDictionary *) getBusinessList: (sqlDB *) connection
{
    NSMutableDictionary * businessDictionary = [[NSMutableDictionary alloc] init];
    
    sqlite3 *vendingDB;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        
        NSString * querySQL = @"SELECT * FROM businesses ORDER BY name";
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                Business * tempBusiness;
                
                businessName = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                address = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                address2 = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 3)] ];
                city = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 4)] ];
                state = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 5)] ];
                zip = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 6)] ];
                tempBusiness = [[Business alloc] initWithName:businessName andAddress:address andAddress2:address2 andCity:city andStat:state andZip:zip];
                tempBusiness.businessID = [[NSNumber alloc] initWithInt: sqlite3_column_int(statement, 0)];
                
                [businessDictionary setObject: tempBusiness forKey: businessName];
            }
            //release statement
            sqlite3_finalize(statement);
        }
        //close DB connection
        sqlite3_close(vendingDB);
    }
    return businessDictionary;
}

- (BOOL) insertBusiness: (Business *) business andProd: (sqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO businesses VALUES (null,'%@','%@','%@','%@','%@','%@')", business.businessName, address, address2, city, state, zip];
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

- (BOOL) deleteBusiness: (Business *) business andProd: (sqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM businesses WHERE name = '%@'", business.businessName ];
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
