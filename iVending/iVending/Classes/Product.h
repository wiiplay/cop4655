//
//  Product.h
//  iVending
//
//  Created by Manuel Pino on 4/17/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"

@interface Product : NSObject

@property (nonatomic) int productID;
@property (strong, nonatomic) NSString *productName;

- (instancetype) initWithName: (NSString *) name;
- (NSDictionary *) getProductList: (sqlDB *) connection;

- (Product *) getProductByID: (sqlDB *) connection andProd: (int) prodtId;
- (Product *) getProductByName: (sqlDB *) connection andProd: (NSString *) prodName;
- (void) insertProduct: (sqlDB *) connection andProd: (Product *) product;

@end