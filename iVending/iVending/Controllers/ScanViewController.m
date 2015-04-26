//
//  ScanViewController.m
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ScanViewController.h"

@implementation ScanViewController

@synthesize resultImageView, resultTextView, imgPicker, business, businessDb, machine, machineDb, myDb;

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
    machine = [[Machines alloc] init];
    businessDb = [[BusinessDb alloc]init];
    machineDb = [[MachinesDb alloc]init];
    
    ZBarReaderViewController *codeReader = [ZBarReaderViewController new];
    codeReader.readerDelegate=self;
    codeReader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = codeReader.scanner;
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    
    [self presentViewController:codeReader animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
  
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
    
    [self processSymbolData: symbol];
    
    // dismiss the controller
    [reader dismissViewControllerAnimated:YES completion:nil];
}
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) processSymbolData: (ZBarSymbol *) result
{
    NSString *content = result.data;
    NSArray *splitContent = [content componentsSeparatedByString:@";"];
    business = (Business *)[businessDb getBusinessByID: [splitContent[1] integerValue] andProd: myDb];
    
    machine.machineID = [NSNumber numberWithInteger:[splitContent[3] integerValue]];
    machine = [machineDb getMachineByID:machine andConnection:myDb];
}

@end
