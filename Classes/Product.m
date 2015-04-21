//
//  Product.m
//  iVending
//
//  Created by Manuel Pino on 4/18/15.
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

@end
