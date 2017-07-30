//
//  DBManager.h
//  SquliteSample
//
//  Created by Parvesh Chauhan on 30/07/17.
//  Copyright © 2017 Parvesh Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}
+(DBManager*)getSharedInstance;
-(BOOL)createDB;
-(BOOL) saveData:(NSString*)registerNumber name:(NSString*)name
      department:(NSString*)department year:(NSString*)year;
-(NSArray*) findByRegisterNumber:(NSString*)registerNumber;


@end
