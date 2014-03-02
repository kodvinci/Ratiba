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

@interface DataManager : NSObject
{
    NSMutableArray *allSpeakers;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+ (DataManager *)defaultDataManager;
- (BOOL)saveChanges;

#pragma mark Speakers
- (NSArray *)allSpeakers;
- (Speaker *)createSpeaker;
- (void)removeSpeaker:(Speaker *)speaker;
- (void)moveSpeakerAtIndex: (int)from toIndex:(int)to;

@end
