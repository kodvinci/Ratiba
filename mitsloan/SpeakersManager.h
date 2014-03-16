//
//  DataManager.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 3/2/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Speaker.h"
#import "FileUtility.h"

@interface SpeakersManager : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *allSpeakers;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    NSURLConnection *connection;
    NSMutableData *xmlSpeakerData;
    NSPersistentStoreCoordinator *psc;
}

+ (SpeakersManager *)defaultDataManager;
- (BOOL) saveChanges;
- (void) fetchSpeakersXml;
- (NSArray *)allSpeakers;
- (void)removeAllSpeakers;

@end
