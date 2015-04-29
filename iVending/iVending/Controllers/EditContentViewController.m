//
//  EditContentViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "EditContentViewController.h"

@implementation EditContentViewController

@synthesize myDb, content, contentDb, machine, product, productDb, productList, contentPicker, price, rowsArray, columnsArray, quantityArray, keys;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myDb = [SqlDB getSqlDB];
    //content = [[VendingContent alloc]init];
    contentDb = [[VendingContentDb alloc] init];
    product = [[Product alloc]init];
    productDb = [[ProductDb alloc]init];
    productList = [[NSMutableDictionary alloc]init];
    productList = [productDb getProductList: myDb];
    keys = [productList allKeys];
    rowsArray = [self getIntArray: machine.numOfRows];
    columnsArray = [self getIntArray: machine.numOfColumns];
    quantityArray = [self getIntArray: [NSNumber numberWithInt:20]];
    contentPicker = [[UIPickerView alloc] init];

}

- (void)viewWillAppear:(BOOL)animated {
    
    myDb = [SqlDB getSqlDB];
    //content = [[VendingContent alloc]init];
    contentDb = [[VendingContentDb alloc] init];
    product = [[Product alloc]init];
    productDb = [[ProductDb alloc]init];
    productList = [[NSMutableDictionary alloc]init];
    productList = [productDb getProductList: myDb];
    keys = [productList allKeys];
    rowsArray = [self getIntArray: machine.numOfRows];
    columnsArray = [self getIntArray: machine.numOfColumns];
    quantityArray = [self getIntArray: [NSNumber numberWithInt:20]];
    contentPicker = [[UIPickerView alloc] init];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setPicker];
}

- (void)viewWillDisappear:(BOOL)animated {
    price.text = @"";
}

- (void) setPicker
{
    product.productID = content.fk_ProductID;
    product = [productDb getProductByID: product andConnection:myDb];
    NSUInteger prodKey = [keys indexOfObject: product.productName];
    
    [contentPicker reloadAllComponents];
    [contentPicker selectRow: prodKey inComponent:0 animated:YES];
    //[contentPicker selectRow: [content.itemRow integerValue] inComponent:1 animated:YES];
    //[contentPicker selectRow:[content.itemColumn integerValue] inComponent:2 animated:YES];
    //[contentPicker selectRow:[content.quanity integerValue] inComponent:3 animated:YES];
    //[contentPicker reloadAllComponents];
}

// or the number of vertical columns
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}

//number of rows the picker will contain
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0 )
    {
        return [keys count];
    }
    if (component == 1 )
    {
        return [rowsArray count];
    }
    if (component == 2 )
    {
        return [columnsArray count];
    }
    if (component == 3 )
    {
        return [quantityArray count];
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0 )
    {
        if (keys != nil) {
            return [keys objectAtIndex:row];
        }
    }
    if (component == 1 )
    {
        if (rowsArray != nil) {
            return [rowsArray objectAtIndex:row];
        }
    }
    if (component == 2 )
    {
        if (columnsArray != nil) {
            return [columnsArray objectAtIndex:row];
        }
    }
    if (component == 3 )
    {
        if (quantityArray != nil) {
            return [quantityArray objectAtIndex:row];
        }
    }
    return @"";
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0 )
    {
        product = [productList objectForKey: [keys objectAtIndex:row] ];
        content.fk_ProductID = product.productID;
    }
    if (component == 1 )
    {
        content.itemRow = [NSNumber numberWithInt: (row + 1)];
    }
    if (component == 2 )
    {
        content.itemColumn = [NSNumber numberWithInt: (row + 1)];
    }
    if (component == 3 )
    {
        content.quanity = [NSNumber numberWithInt: (row + 1)];
    }
}

- (NSArray *) getIntArray: (NSNumber *) max
{
    NSMutableArray *build = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [max intValue]; i++) {
        [build addObject: [NSString stringWithFormat: @"%@", [NSNumber numberWithInt:i+1] ]];
    }
    
    return [NSArray arrayWithArray:build];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editContent:(id)sender {
    content.fk_MachineID = machine.machineID;
    content.cost = [price.text doubleValue];
    [contentDb insertContent:content andConnection:myDb];
    [self.navigationController popViewControllerAnimated:YES];
}
 
// if the keyboard is showing and you touch anywhere in the view it will hide the keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [[event allTouches] anyObject];
    if( [price isFirstResponder] && [touch view] != price ){
        [price resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}

//when the return button is pressed it will return focus to the view
- (IBAction)textFieldReturn:(id)sender{
    
    [sender resignFirstResponder];
}
 


@end
