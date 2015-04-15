//
//  products.h
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlDB.h"

@interface products : NSObject

@property (strong, nonatomic) sqlDB *myDB;
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSMutableDictionary *productsList;
- (NSDictionary *) getProductList;

@end
