//  PROGRAMMER:     Manuel Pino
//  PANTHERID:      2333234
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Class Project
//  DUE:            Wednesday 4/29/15
/*
    created to initialize the database uppon first installing the app. After that it will serve as an initializer of the path to the DB
 */
#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface SqlDB : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *vendingDB;
@property (nonatomic, strong) NSString *documentsDirectory;

//returns a reference to the path of the DB
+ (SqlDB *) getSqlDB;

@end
