//
//  PanelsManager.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 3/16/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileUtility.h"
#import <CoreData/CoreData.h>
#import "Panel.h"

@interface PanelsManager : NSObject<NSXMLParserDelegate>
{
    NSMutableArray *allPanels;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    NSURLConnection *connection;
    NSMutableData *xmlPanelData;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

+ (PanelsManager *)defaultPanelsManager;
- (BOOL) saveChanges;
- (void) fetchPanelsXml;
- (NSArray *)allPanels;

@end
