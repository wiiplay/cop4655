//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "SqlDB.h"
#import "Product.h"

@interface ProductDb : NSObject

@property (strong, nonatomic) Product *product;

//get a list of all products in the product table
- (NSMutableDictionary *) getProductList: (SqlDB *) connection;
//gets a specific product by its ID from the product table
- (Product *) getProductByID: (Product *) passed andConnection: (SqlDB *) connection;
//gets a specific product by its name from the product table
- (Product *) getProductByName: (Product *) passed andConnection: (SqlDB *) connection;
//insert a new product into the product table
- (BOOL) insertProduct: (Product *) passed andConnection: (SqlDB *) connection;
//delete a product from the product table
- (BOOL) deleteProduct: (Product *) passed andConnection: (SqlDB *) connection;

@end
