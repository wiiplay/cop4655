//
//  Product.h
//  iVending
//
//  Created by Manuel Pino on 4/17/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"

@interface ProductDb : NSObject

@property (nonatomic) int productID;
@property (strong, nonatomic) NSString *productName;

- (instancetype) initWithName: (NSString *) name;

- (NSMutableDictionary *) getProductList: (sqlDB *) connection;
- (ProductDb *) getProductByID: (sqlDB *) connection andProd: (int) prodtId;
- (ProductDb *) getProductByName: (sqlDB *) connection andProd: (NSString *) prodName;
- (BOOL) insertProduct: (sqlDB *) connection andProd: (ProductDb *) product;
- (BOOL) deleteProduct: (sqlDB *) connection andProd: (ProductDb *) product;

@end
