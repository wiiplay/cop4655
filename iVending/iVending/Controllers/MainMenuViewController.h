//
//  MainMenuViewController.h
//  iVending
//
//  Created by Manny Pino on 4/20/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainMenuViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIToolbar *mainToolBar;

- (IBAction)scanQr:(id)sender;
- (IBAction)searchEdit:(id)sender;

@end
