//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>
#import "SqlDB.h"
#import "User.h"

@interface UserDb : NSObject

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) User *user;

//Insert a new user record into the user table from a user object
- (BOOL) insertUser: (User *) passed andConnection: (SqlDB *) connection;
//get a user record from the user table by the user name
- (User *) getUser: (User *) passed andConnection: (SqlDB *) connection;
//determine if the user name passed exists in the user table
- (BOOL) userExist: (User *) passed andConnection: (SqlDB *) connection;

@end
