//
//  Product.h
//  iVending
//
//  Created by Manuel Pino on 4/17/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqlDB.h"
#import "Product.h"

@interface ProductDb : NSObject

@property (strong, nonatomic) Product *product;

- (NSMutableDictionary *) getProductList: (SqlDB *) connection;
- (Product *) getProductByID: (Product *) passed andConnection: (SqlDB *) connection;
- (Product *) getProductByName: (Product *) passed andConnection: (SqlDB *) connection;
- (BOOL) insertProduct: (Product *) passed andConnection: (SqlDB *) connection;
- (BOOL) deleteProduct: (Product *) passed andConnection: (SqlDB *) connection;

@end
