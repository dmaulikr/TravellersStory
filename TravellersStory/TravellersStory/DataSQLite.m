//
//  DataSQLite.m
//  TravellersStory
//
//  Created by Stella on 2/7/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "DataSQLite.h"
#import "AppDelegate.h"
#import "CoreData/CoreData.h"

@implementation DataSQLite

-(instancetype)init{
    self = [super init];
    
    return self;
}


-(NSArray*)fetchMyStories:(NSString*)entityName andSorter:(NSString *)sortExpr{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    /*
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:sortExpr ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject: sort]];
    */
    
    NSError *error;
    NSArray *myStories =[managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return myStories;
}

@end
