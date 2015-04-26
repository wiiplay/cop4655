//
//  UserDb.h
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqlDB.h"
#import "User.h"

@interface UserDb : NSObject

@property (strong, nonatomic) SqlDB *myDb;
@property (strong, nonatomic) User *user;
- (BOOL) insertUser: (User *) passed andConnection: (SqlDB *) connection;
- (User *) getUser: (User *) passed andConnection: (SqlDB *) connection;
- (BOOL) userExist: (User *) passed andConnection: (SqlDB *) connection;

@end
