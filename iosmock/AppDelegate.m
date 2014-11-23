//
//  AppDelegate.m
//  iosmock
//
//  Created by Kevin Zhang on 11/22/14.
//  Copyright (c) 2014 Kevin Zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "FMDB.h"


@interface AppDelegate ()

@property(strong,nonatomic)NSString* databasePath;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentDir stringByAppendingPathComponent:@"iosmock.sqlite"];
    [self createAndCheckDatabase];
//    [self testSqlite];
    
    return YES;
}

-(void) createAndCheckDatabase
{
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success) return; // If file exists, don't do anything
    
    // if file does not exist, make a copy of the one in the Resources folder
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"iosmock.sqlite"]; // File path
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil]; // Make a copy of the file in the Documents folder
    
}

-(void)testSqlite {
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.databasePath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:@"CREATE TABLE person(name PRIMARY KEY, age);"];
        [db executeUpdate:@"CREATE TABLE spouse(name1, name2);"];
        [db executeUpdate:@"insert into person values (?, ?);", @"kevin", [NSNumber numberWithInt:44]];
        [db executeUpdate:@"insert into person values (?, ?);", @"susana", [NSNumber numberWithInt:32]];
        [db executeUpdate:@"insert into spouse values (?, ?);", @"kevin", @"susana"];
        
        FMResultSet *rs = [db executeQuery:@"select * from person, spouse where person.name=spouse.name1"];
        while ([rs next]) {
            NSLog(@"columnCount: %d", rs.columnCount);
            NSString* str0 = [rs stringForColumnIndex:0];
            NSLog(@"str0: %@", str0);
            
            NSString* str1 = [rs stringForColumnIndex:1];
            NSLog(@"str1: %@", str1);
            
            NSString* str2 = [rs stringForColumnIndex:2];
            NSLog(@"str2: %@", str2);
            
            NSString* str3 = [rs stringForColumnIndex:3];
            NSLog(@"str3: %@", str3);
        }
//        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
        
//        if (whoopsSomethingWrongHappened) {
//            *rollback = YES;
//            return;
//        }
        
    }];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
