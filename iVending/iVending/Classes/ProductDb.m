//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "ProductDb.h"

@implementation ProductDb

@synthesize product;

//gets a specific product by its ID from the product table
- (Product *) getProductByID: (Product *) passed andConnection: (SqlDB *) connection
{
    product =[[Product alloc] init];
    
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        const char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT * FROM products WHERE productID = %d", [passed.productID intValue] ];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, &errMsg) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                NSString *name = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                product.productName = name;
                product.productID = passed.productID;
                
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return product;
}

//gets a specific product by its name from the product table
- (Product *) getProductByName: (Product *) passed andConnection: (SqlDB *) connection
{
    
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT ID FROM products WHERE name = '%@'", passed.productName];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            int prodId =  sqlite3_column_int(statement, 0) ;
            product = [[Product alloc] initWithName: passed.productName];
            product.productID = [NSNumber numberWithInt: prodId];
        }
        
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return product;
}

//get a list of all products in the product table
- (NSMutableDictionary *) getProductList: (SqlDB *) connection
{
    NSMutableDictionary * products = [[NSMutableDictionary alloc] init];
    
    sqlite3 *vendingDB;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        
        NSString * querySQL = @"SELECT * FROM products ORDER BY name DESC";
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                //get the product name and format it to nsstring;
                NSString *value = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                //get the id from the row and convert it to nsstring
                NSNumber *key = [NSNumber numberWithInt: sqlite3_column_int(statement, 0)];
                product = [[Product alloc] initWithName:value];
                product.productID = key;
                
                //add the product to the products dictionary;
                [products setObject:product forKey: value];
            }
            //release statement
            sqlite3_finalize(statement);
        }
        //close DB connection
        sqlite3_close(vendingDB);
    }
    return products;
}

//insert a new product into the product table
- (BOOL) insertProduct: (Product *) passed andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO products VALUES (null,'%@')", passed.productName ];
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

//delete a product from the product table
- (BOOL) deleteProduct: (Product *) passed andConnection: (SqlDB *) connection
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM products WHERE name = '%@'", passed.productName ];
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
