//
//  TempViewController.m
//  iVending
//
//  Created by Manny Pino on 4/14/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@end

@implementation TempViewController

@synthesize myDB, myProducts, theProduct;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myDB = [sqlDB getSqlDB];
    theProduct = [[Product alloc] initWithName: @"Tacos"];
    theProduct = nil;
    [theProduct insertProduct: myDB andProd: theProduct];
    theProduct = [[Product alloc] initWithName: @"Cheetos"];
    [theProduct deleteProduct:myDB andProd: theProduct];
    [theProduct getProductList: myDB];

    NSString * type;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
