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

@property (strong, nonatomic) sqlDB *myDB;
@property (nonatomic) int *productID;
@property (strong, nonatomic) NSString *productName;

- (instancetype) initWithName: (NSString *) name;
- (NSDictionary *) getProductList;

- (Product *) getProductByID: (int) prodtId;
- (Product *) getProductByName: (NSString *) prodName;
- (void) insertProduct: (Product *) product;

@end
