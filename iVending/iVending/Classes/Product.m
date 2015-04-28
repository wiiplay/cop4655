//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "Product.h"

@implementation Product

@synthesize productID, productName;

//initialize a product object
- (instancetype) initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        productName = name;
    }
    return self;
}

@end
