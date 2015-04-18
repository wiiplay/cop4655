//
//  Product.m
//  iVending
//
//  Created by Manuel Pino on 4/17/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize productID, productName;

- (instancetype) initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        productName = name;
    }
    return self;
}

- (Product *) getProductByID: (sqlDB *) connection andProd: (int) prodtId
{
    Product * product;
    
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT name FROM products WHERE ID = %d", prodtId];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW){
                NSString *name = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                product = [[Product alloc] initWithName: name];
            }
        }
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return product;
}

- (Product *) getProductByName: (sqlDB *) connection andProd: (NSString *) prodName
{
    Product * product;
    
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDb;
    if (sqlite3_open(dbpath, &(vendingDb)) == SQLITE_OK) {
        
        NSString * querySQL = [NSString stringWithFormat: @"SELECT ID FROM products WHERE name = '%@'", prodName];
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDb, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            int prodId =  sqlite3_column_int(statement, 0) ;
            product = [[Product alloc] initWithName: prodName];
            product.productID = prodId;
        }
        
        //release statement
        sqlite3_finalize(statement);
        
        //close DB connection
        sqlite3_close(vendingDb);
    }
    
    return product;
}

- (NSMutableDictionary *) getProductList: (sqlDB *) connection
{
    NSMutableDictionary * products = [[NSMutableDictionary alloc] init];
    
    sqlite3 *vendingDB;
    sqlite3_stmt * statement;
    const char *dbpath = [connection.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        
        NSString * querySQL = @"SELECT * FROM products ORDER BY name";
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                //get the product name and format it to nsstring;
                NSString *value = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                //get the id from the row and convert it to nsstring
                NSNumber *key = [NSNumber numberWithInt: sqlite3_column_int(statement, 0)];
                //add the product to the products dictionary;
                [products setObject:value forKey: key];
            }
            //release statement
            sqlite3_finalize(statement);
        }
        //close DB connection
        sqlite3_close(vendingDB);
    }
    return products;
}

- (BOOL) insertProduct: (sqlDB *) connection andProd: (Product *) product
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"INSERT INTO products VALUES (null,'%@')", product.productName ];
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

- (BOOL) deleteProduct: (sqlDB *) connection andProd: (Product *) product
{
    const char *dbpath = [connection.databasePath UTF8String];
    
    sqlite3 *vendingDB;
    if (sqlite3_open(dbpath, &(vendingDB)) == SQLITE_OK) {
        char *errMsg;
        
        NSString * querySQL = [NSString stringWithFormat: @"DELETE FROM products WHERE name = '%@'", product.productName ];
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
