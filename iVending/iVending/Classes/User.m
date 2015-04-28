//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import "User.h"

@implementation User

@synthesize userID, userName, password;

//a reference to a static user object
+ (User *) getUser
{
    static User *myUser;
    
    if ([myUser userID] == nil) {
        myUser = [[User alloc] init];
    }
    return myUser;
}

//initialize a user object with its editable content
- (instancetype) initWithUser: (NSString *) username andPassword: (NSString *) userPassword
{
    self = [super init];
    if (self) {
        userName = username;
        password = userPassword;
    }
    return self;
}

//validate two user objects at login
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
