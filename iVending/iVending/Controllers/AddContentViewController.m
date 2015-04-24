//
//  AddContentViewController.m
//  iVending
//
//  Created by Manny Pino on 4/24/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AddContentViewController.h"

@implementation AddContentViewController

@synthesize myDb, content, contentDb, machine, product, productDb, productList, productArray, contentPicker, price, rowsArray, columnsArray, quantityArray, keys;

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
    myDb = [sqlDB getSqlDB];
    contentDb = [[VendingContentDb alloc] init];
    productDb = [[ProductDb alloc]init];
    productList = [productDb getProductList: myDb];
    keys = [productList allKeys];
    productArray = [productList allValues];
    rowsArray = [self getIntArray: machine.numOfRows];
    columnsArray = [self getIntArray: machine.numOfColumns];
    quantityArray = [self getIntArray: [NSNumber numberWithInt:20]];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear:animated];
    
    myDb = [sqlDB getSqlDB];
    contentDb = [[VendingContentDb alloc] init];
    productDb = [[ProductDb alloc]init];
    productList = [productDb getProductList: myDb];
    keys = [productList allKeys];
    productArray = [productList allValues];
    rowsArray = [self getIntArray: machine.numOfRows];
    columnsArray = [self getIntArray: machine.numOfColumns];
    quantityArray = [self getIntArray: [NSNumber numberWithInt:20]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    price.text = @"";
}

// or the number of vertical columns
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}

//number of rows the picker will contain
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    if (component == 1 )
    {
        return [productArray count];
    }
    if (component == 2 )
    {
        return [rowsArray count];
    }
    if (component == 3 )
    {
        return [columnsArray count];
    }
    if (component == 4 )
    {
        return [quantityArray count];
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    if (component == 1 )
    {
        if (productArray != nil) {
            return [productArray objectAtIndex:row];
        }
    }
    if (component == 2 )
    {
        if (rowsArray != nil) {
            return [rowsArray objectAtIndex:row];
        }
    }
    if (component == 3 )
    {
        if (columnsArray != nil) {
            return [columnsArray objectAtIndex:row];
        }
    }
    if (component == 4 )
    {
        if (quantityArray != nil) {
            return [quantityArray objectAtIndex:row];
        }
    }
    return @"";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveContent:(id)sender {
}

- (IBAction)backButton:(id)sender {
}
@end
