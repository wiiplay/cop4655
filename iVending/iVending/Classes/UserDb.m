//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "UserDb.h"

@implementation UserDb

@synthesize myDb, user;

//determine if the user name passed exists in the user table
- (BOOL) userExist: (User *) passed andConnection: (SqlDB *) connection
{
    BOOL exists = NO;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM users WHERE userName = '%@'", [passed.userName lowercaseString] ];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                NSString *name = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                if (name != nil) {
                    exists = YES;
                }
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return exists;
}

//get a user record from the user table by the user name
- (User *) getUser: (User *) passed andConnection: (SqlDB *) connection
{
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM users WHERE userName = '%@'", [passed.userName lowercaseString] ];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                
                NSString *name = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                user.userName = name;
                NSString *password = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 2)] ];
                user = [[User alloc] initWithUser:name andPassword:password];
                NSNumber *userId = [NSNumber numberWithInt: sqlite3_column_int(statement, 0)];
                user.userID = userId;
                
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }

    return user;
}

//Insert a new user record into the user table from a user object
- (BOOL) insertUser: (User *) passed andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO users VALUES (null,'%@','%@')", passed.userName , passed.password ];
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
