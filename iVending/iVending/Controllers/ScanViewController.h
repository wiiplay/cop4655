//
//  ScanViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
#import "BusinessDb.h"
#import "MachinesDb.h"
#import "TakeInventoryTableViewController.h"

@interface ScanViewController : UIViewController <UIImagePickerControllerDelegate,ZBarReaderDelegate>

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) Machines *machine;
@property (strong, nonatomic) MachinesDb *machineDb;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) BusinessDb *businessDb;
@property (nonatomic, retain) IBOutlet UILabel *resultTextView;
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;
@property (nonatomic, retain) UIImagePickerController *imgPicker;
@property (strong, nonatomic) IBOutlet UIButton *takeInventory;
- (IBAction)scanBarcode:(id)sender;
- (IBAction)takeInventory:(id)sender;

@end
