//
//  Product.h
//  iVending
//
//  Created by Manuel Pino on 4/17/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"
#import "Product.h"

@interface ProductDb : NSObject

@property (strong, nonatomic) Product *product;

- (NSMutableDictionary *) getProductList: (sqlDB *) connection;
- (Product *) getProductByID: (Product *) passed andConnection: (sqlDB *) connection;
- (Product *) getProductByName: (Product *) passed andConnection: (sqlDB *) connection;
- (BOOL) insertProduct: (Product *) passed andConnection: (sqlDB *) connection;
- (BOOL) deleteProduct: (Product *) passed andConnection: (sqlDB *) connection;

@end
