//
//  User.m
//  iVending
//
//  Created by Manuel Pino on 4/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userID, userName, password;

+ (User *) getUser
{
    static User *myUser;
    
    if ([myUser userID] == nil) {
        myUser = [[User alloc] init];
    }
    return myUser;
}

- (instancetype) initWithUser: (NSString *) username andPassword: (NSString *) userPassword
{
    self = [super init];
    if (self) {
        userName = username;
        password = userPassword;
    }
    return self;
}

- (BOOL) validateLogin: (User *) passedEntered andCompare: (User *) passedCompare
{
    BOOL valid = NO;
    
    if ( [[passedEntered.userName lowercaseString] isEqualToString: [passedCompare.userName lowercaseString]] ) {
        if ( [passedEntered.password isEqualToString: passedCompare.password]) {
            valid = YES;
        }
    }
    
    return valid;
}

















@end
