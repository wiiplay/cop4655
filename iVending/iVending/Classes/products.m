//
//  products.m
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "products.h"

@implementation products

@synthesize myDB, productID, productName, productsList;

- (instancetype) initWithName: name
{
    self = [super init];
    if (self) {
        productName = name;
        myDB = [sqlDB getSqlDB];
    }
    return self;
}

- (NSDictionary *) getProductList
{
    NSDictionary * products = [[NSDictionary alloc] init];
    
    sqlite3_stmt * statement;
    const char *dbpath = [myDB.databasePath UTF8String];
    
    sqlite3 *temp = myDB.vendingDB;
    if (sqlite3_open(dbpath, &(temp)) == SQLITE_OK) {
        
        NSString * querySQL = @"SELECT * FROM products";
        const char *query_statement = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(vendingDB, query_statement, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                //get the product name and format it to nsstring;
                NSString *value = [[NSString alloc] initWithString: [NSString stringWithUTF8String: (char *) sqlite3_column_text(statement, 1)] ];
                //get the id from the row and convert it to nsstring
                NSString *key = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d",sqlite3_column_int(statement, 0)]];
                //add the product to the products dictionary;
                [products setValue: value forKey: key ];
            }
            //release statement
            sqlite3_finalize(statement);
        }
        //close DB connection
        sqlite3_close(vendingDB);
    }
    return products;
}

@end
