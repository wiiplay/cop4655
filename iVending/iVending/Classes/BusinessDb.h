//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15
/*
 Used as an accessor class to the DB content to read and write from the Business table
 */

#import <Foundation/Foundation.h>
#import "Business.h"
#import "SqlDB.h"

@interface BusinessDb : NSObject

//used to store extracted business content
@property (strong, nonatomic) Business *business;

//all methods must receive an SqlDb singleton reference to access the DB file
//allows you to get all of a business content from the business table by a business name
- (Business *) getBusinessByName: (NSString *) name andDb: (SqlDB *) connection;
//allows you to get all of a business content from the business table by a business ID
- (Business *) getBusinessByID: (Business *) passed andProd: (SqlDB *) connection;
//allows you to get a dictionary of business objects from the business table
- (NSMutableDictionary *) getBusinessList: (SqlDB *) connection;
// allows you to enter a business into the system by passing a business object
- (BOOL) insertBusiness: (Business *) business andProd: (SqlDB *) connection;
//allows you to delete a business record in the business table by passing a bussiness object
- (BOOL) deleteBusiness: (Business *) business andProd: (SqlDB *) connection;
//allows you to update a business record by passing a bussiness object
- (BOOL) updateBusiness: (Business *) passed andProd: (SqlDB *) connection;

@end
