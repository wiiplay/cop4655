//
//  EditContentViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VendingContentDb.h"
#import "ProductDb.h"

@interface EditContentViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) ProductDb *productDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) VendingContent *content;
@property (strong, nonatomic) VendingContentDb *contentDb;
@property (strong, nonatomic) NSMutableDictionary *productList;
@property (strong, nonatomic) NSArray *keys;
@property (strong, nonatomic) NSArray *rowsArray;
@property (strong, nonatomic) NSArray *columnsArray;
@property (strong, nonatomic) NSArray *quantityArray;

@property (strong, nonatomic) IBOutlet UIPickerView *contentPicker;
@property (strong, nonatomic) IBOutlet UITextField *price;

- (IBAction)editContent:(id)sender;



@end
