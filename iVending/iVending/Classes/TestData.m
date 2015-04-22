//
//  TestData.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "TestData.h"

@implementation TestData

- (void) populateData
{
    
    myDB = [sqlDB getSqlDB] ;
    business = [[Business alloc] init];
    businessDb = [[BusinessDb alloc] init];
    machineDb = [[MachinesDb alloc] init];
    machine = [[Machines alloc] init];
    product = [[Product alloc] init];
    productDb = [[ProductDb alloc] init];
    content = [[VendingContent alloc] init];
    contentDb = [[VendingContentDb alloc]init];
    
    NSMutableDictionary *list = [productDb getProductList: myDB];
    if ( list.count == 0) {
     
    
        //generate a list of products
        listOfProducts = [[NSMutableArray alloc] init];
        productList = @[@"Cheetos", @"Doritos", @"Hot Fries", @"Stacys Chips", @"Snickers", @"Pepsi", @"Coke", @"Mountain Dew", @"Sierra Mist", @"Sprite"];
        
        //generate a list of businesses
        businessList = [[NSMutableArray alloc] init];
        business = [business initWithName:@"Dolphin Mall" andAddress:@"123 South Way" andAddress2:@"" andCity:@"Miami" andStat:@"FL" andZip: [NSNumber numberWithInt:33147]];
        [businessList addObject:business];
        
        business = [[Business alloc] initWithName:@"Miami Dade North" andAddress:@"10744 NW 27 Ave" andAddress2:@"" andCity:@"Miami" andStat:@"FL" andZip: [NSNumber numberWithInt:33014]];
        [businessList addObject:business];
        
        
        //Generate machines for frist businesses
        machineList1 = [[NSMutableArray alloc] init];
        
        machine = [[Machines alloc] initWithDescription:@"North" andFKBusinessID: [NSNumber numberWithInt:1] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList1 addObject: machine];
        
        machine = [[Machines alloc] initWithDescription:@"East" andFKBusinessID: [NSNumber numberWithInt:1] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList1 addObject: machine];
        
        machine = [[Machines alloc]  initWithDescription:@"West" andFKBusinessID: [NSNumber numberWithInt:1] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList1 addObject: machine];
        
        machine = [[Machines alloc] initWithDescription:@"South" andFKBusinessID: [NSNumber numberWithInt:1] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList1 addObject: machine];
        
        //Generate machines for second businesses
        machineList2 = [[NSMutableArray alloc] init];
        
        machine = [[Machines alloc]  initWithDescription:@"North" andFKBusinessID: [NSNumber numberWithInt:2] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList2 addObject: machine];
        
        machine = [[Machines alloc]  initWithDescription:@"East" andFKBusinessID: [NSNumber numberWithInt:2] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList2 addObject: machine];
        
        machine = [[Machines alloc]  initWithDescription:@"West" andFKBusinessID: [NSNumber numberWithInt:2] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList2 addObject: machine];
        
        machine = [[Machines alloc]  initWithDescription:@"South" andFKBusinessID: [NSNumber numberWithInt:2] andRows:[NSNumber numberWithInt:3] andColumns:[NSNumber numberWithInt:3]];
        
        [machineList2 addObject: machine];
    
        
        contentList1 = [[NSMutableArray alloc] init];
        contentList2 = [[NSMutableArray alloc] init];
        contentList3 = [[NSMutableArray alloc] init];
        contentList4 = [[NSMutableArray alloc] init];
        contentList5 = [[NSMutableArray alloc] init];
        contentList6 = [[NSMutableArray alloc] init];
        contentList7 = [[NSMutableArray alloc] init];
        contentList8 = [[NSMutableArray alloc] init];
        content = [[VendingContent alloc] init];
        
        //Add Content
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:1] andProductFk:[NSNumber numberWithInt:1] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList1 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:1] andProductFk:[NSNumber numberWithInt:2] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList1 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:1] andProductFk:[NSNumber numberWithInt:3] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList1 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:2] andProductFk:[NSNumber numberWithInt:4] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList2 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:2] andProductFk:[NSNumber numberWithInt:5] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList2 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:2] andProductFk:[NSNumber numberWithInt:1] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList2 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:3] andProductFk:[NSNumber numberWithInt:6] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList3 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:3] andProductFk:[NSNumber numberWithInt:7] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList3 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:3] andProductFk:[NSNumber numberWithInt:8] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList3 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:4] andProductFk:[NSNumber numberWithInt:9] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList4 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:4] andProductFk:[NSNumber numberWithInt:10] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList4 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:4] andProductFk:[NSNumber numberWithInt:2] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList4 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:5] andProductFk:[NSNumber numberWithInt:3] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList5 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:5] andProductFk:[NSNumber numberWithInt:4] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList5 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:5] andProductFk:[NSNumber numberWithInt:5] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList5 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:6] andProductFk:[NSNumber numberWithInt:6] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList6 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:6] andProductFk:[NSNumber numberWithInt:7] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList6 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:6] andProductFk:[NSNumber numberWithInt:8] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList6 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:7] andProductFk:[NSNumber numberWithInt:8] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList7 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:7] andProductFk:[NSNumber numberWithInt:9] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList7 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:7] andProductFk:[NSNumber numberWithInt:10] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList7 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:8] andProductFk:[NSNumber numberWithInt:1] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:1] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList8 addObject:content];
        
        content = [[VendingContent alloc] initWithMachineFk:[NSNumber numberWithInt:8] andProductFk:[NSNumber numberWithInt:1] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:2] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList8 addObject:content];
        
        content = [[VendingContent alloc]initWithMachineFk:[NSNumber numberWithInt:8] andProductFk:[NSNumber numberWithInt:1] andItemRow:[NSNumber numberWithInt:1] andItemColumn:[NSNumber numberWithInt:3] andItemQuantity:[NSNumber numberWithInt:10] andCost:1.00];
        
        [contentList8 addObject:content];
        
        for (int i = 0; i < productList.count; i++) {
            product =[[Product alloc] initWithName:productList[i]];
            [listOfProducts addObject:product];
        }
        
        for (int i = 0; i < listOfProducts.count; i++) {
            [productDb insertProduct:listOfProducts[i] andConnection:myDB];
        }
        
        for (int i = 0; i < businessList.count; i++) {
            [businessDb insertBusiness:businessList[i] andProd:myDB];
        }
        
        for (int i = 0; i < machineList1.count; i++) {
            [machineDb insertMachine: machineList1[i] andConnection:myDB];
        }
        
        for (int i = 0; i < machineList2.count; i++) {
            [machineDb insertMachine: machineList2[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList1.count; i++) {
            [contentDb insertContent:contentList1[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList2.count; i++) {
            [contentDb insertContent:contentList2[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList3.count; i++) {
            [contentDb insertContent:contentList3[i] andConnection:myDB];
        }
        
        for (int i = 0; i <  contentList4.count; i++) {
            [contentDb insertContent:contentList4[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList5.count; i++) {
            [contentDb insertContent:contentList5[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList6.count; i++) {
            [contentDb insertContent:contentList6[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList7.count; i++) {
            [contentDb insertContent:contentList7[i] andConnection:myDB];
        }
        
        for (int i = 0; i < contentList8.count; i++) {
            [contentDb insertContent:contentList8[i] andConnection:myDB];
        }
        
    }
    /*
    NSMutableDictionary *listofbusinesses = [businessDb getBusinessList:myDB];
    NSArray *businessKeys = [listofbusinesses allKeys];
    NSMutableDictionary *listofproducts = [productDb getProductList:myDB];
    business = nil;
    business = [[Business alloc] init];
    business = [listofbusinesses objectForKey: businessKeys[0]];
    Business * temp = [[Business alloc] init];
    temp = [listofbusinesses objectForKey: businessKeys[1]];
    NSMutableDictionary *listofMachines1 = [machineDb getMachineList: business andConnection:myDB];
    NSMutableDictionary *listofMachines2 = [machineDb getMachineList: temp  andConnection:myDB];
    NSMutableDictionary *listOfVendingItems1 = [contentDb getContentListForLocation:business andConnection:myDB];
    NSMutableDictionary *listOfVendingItems2 = [contentDb getContentListForLocation:temp andConnection:myDB];
    */
}

@end
