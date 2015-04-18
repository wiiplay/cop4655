//
//  TempViewController.h
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface TempViewController : UIViewController

@property (nonatomic) sqlDB *myDB;
@property (strong, nonatomic) Product *myProduct;
@property (strong, nonatomic) NSDictionary *myProducts;


@end