//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSNumber *userID;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;

//a reference to a static user object
+ (User *) getUser;
//initialize a user object with its editable content
- (instancetype) initWithUser: (NSString *) username andPassword: (NSString *) userPassword;
//validate two user objects at login
- (BOOL) validateLogin: (User *) passedEntered andCompare: (User *) passedCompare;

@end
