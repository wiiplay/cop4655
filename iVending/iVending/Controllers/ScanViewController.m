//
//  ScanViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ScanViewController.h"

@implementation ScanViewController

@synthesize resultImageView, resultTextView, imgPicker, business, businessDb, machine, machineDb, myDb, takeInventory;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myDb = [SqlDB getSqlDB];
    machine = [Machines getMachine];
    business = [[Business alloc] init];
    businessDb = [[BusinessDb alloc]init];
    machineDb = [[MachinesDb alloc]init];
    [self scanBarcode:self];
}

- (void)viewWillAppear:(BOOL)animated {
    myDb = [SqlDB getSqlDB];
    machine = [Machines getMachine];
    business = [[Business alloc] init];
    businessDb = [[BusinessDb alloc]init];
    machineDb = [[MachinesDb alloc]init];
}


- (void)viewWillDisappear:(BOOL)animated {
    resultTextView.text = @"Content";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)scanBarcode:(id)sender {
    
    ZBarReaderViewController *codeReader = [ZBarReaderViewController new];
    codeReader.readerDelegate=self;
    codeReader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = codeReader.scanner;
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    
    [self presentViewController:codeReader animated:YES completion:nil];
    
}

- (IBAction)takeInventory:(id)sender {
    [self performSegueWithIdentifier:@"inventory" sender:self];
}

- (void) readerControllerDidFailToRead: (ZBarReaderController*) reader
                             withRetry: (BOOL) retry{
    NSLog(@"the image picker failing to read");
    
}

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    
    //  get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // just grab the first barcode
        break;
    
    // showing the result on textview
    resultTextView.text = symbol.data;
    
    resultImageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    
    if ( [self processSymbolData: symbol] ) {
        [takeInventory setHidden: NO];
    }
    
    // dismiss the controller
    [reader dismissViewControllerAnimated:YES completion:nil];
    
}
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(BOOL) processSymbolData: (ZBarSymbol *) result
{
    BOOL exists = NO;
    NSString *content = result.data;
    NSArray *splitContent = [content componentsSeparatedByString:@";"];
    business.businessID = [NSNumber numberWithInt: [splitContent[1] intValue]];
    business = [businessDb getBusinessByID: business andProd: myDb];
    
    Machines *current = [[Machines alloc] init];
    current.machineID = [NSNumber numberWithInteger:[splitContent[3] integerValue]];
    current = [machineDb getMachineByID:current andConnection:myDb];
    
    if (business != nil && machine != nil) {
        machine.machineID = current.machineID;
        machine.fk_BusinessID = current.fk_BusinessID;
        exists = YES;
    }
    return exists;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"inventory"]){
        //[self.navigationController popToRootViewControllerAnimated:YES];
    }
}








@end
