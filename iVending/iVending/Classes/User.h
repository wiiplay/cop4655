//
//  User.h
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSNumber *userID;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;

+ (User *) getUser;
- (instancetype) initWithUser: (NSString *) username andPassword: (NSString *) userPassword;
- (BOOL) validateLogin: (User *) passedEntered andCompare: (User *) passedCompare;

@end
