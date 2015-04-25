//
//  Product.h
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProductDb;

@interface Product : NSObject

@property (strong, nonatomic) ProductDb *productDb;
@property (nonatomic) NSNumber *productID;
@property (strong, nonatomic) NSString *productName;

- (instancetype) initWithName: (NSString *) name;

@end
