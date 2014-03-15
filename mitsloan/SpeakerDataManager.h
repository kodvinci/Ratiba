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

@interface SpeakerDataManager : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *allSpeakers;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    NSURLConnection *connection;
    NSMutableData *xmlSpeakerData;
}

+ (SpeakerDataManager *)defaultDataManager;
- (BOOL) saveChanges;
- (void) fetchSpeakersXml;

#pragma mark Speakers
- (NSArray *)allSpeakers;
- (Speaker *)createSpeaker;

@end
