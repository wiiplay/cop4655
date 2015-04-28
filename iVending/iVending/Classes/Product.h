//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
@class ProductDb;

@interface Product : NSObject

@property (strong, nonatomic) ProductDb *productDb;
@property (nonatomic) NSNumber *productID;
@property (strong, nonatomic) NSString *productName;

//initialize a product object
- (instancetype) initWithName: (NSString *) name;

@end
