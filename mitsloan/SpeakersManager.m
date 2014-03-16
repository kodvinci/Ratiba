//
//  DataManager.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 3/2/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "SpeakersManager.h"

static SpeakersManager *defaultDataManager = nil;

@implementation SpeakersManager

+ (SpeakersManager *) defaultDataManager
{
    if (!defaultDataManager) {
        defaultDataManager = [[super allocWithZone:NULL] init];
    }
    return defaultDataManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultDataManager];
}

- (id)init
{
    if (defaultDataManager) {
        return defaultDataManager;
    }
    
    self = [super init];
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSString *path = pathInDocumentDirectory(@"speakerstore.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    
    NSError *error = nil;
    
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    
    [context setUndoManager:nil];
    
    //TODO FIX FIX
    //[self removeAllSpeakers];
    //[self fetchSpeakersXml];
    
    return self;
}

- (void) fetchSpeakersXml
{
    xmlSpeakerData = [[NSMutableData alloc] init];
    NSURL *speakersURL = [NSURL URLWithString: @"http://conference-app-backend.appspot.com/serve"];
    NSURLRequest *request = [NSURLRequest requestWithURL:speakersURL];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [xmlSpeakerData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlSpeakerData];
    [parser setDelegate:self];
    [parser parse];
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@", [error localizedDescription]];
    NSLog(@"%@ ERROR: ", errorString);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqual:@"Speaker"]) {
        NSLog(@"%@ found a %@ element", self, elementName);
        Speaker *speaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speaker" inManagedObjectContext:context];
        [speaker setParentParserDelegate:self];
        [parser setDelegate:speaker];
        
        [allSpeakers addObject:speaker];
        [self saveChanges]; 
    }
 
}

- (BOOL)saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if (!successful) {
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    return successful;
}

- (NSArray *) allSpeakers
{
    [self fetchSpeakersIfNecessary];
    return allSpeakers;
}

- (void) fetchSpeakersIfNecessary
{
    if (!allSpeakers) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [[model entitiesByName] objectForKey:@"Speaker"];
        [request setEntity:entity];
        NSSortDescriptor *sd = [NSSortDescriptor
                                sortDescriptorWithKey:@"orderingValue"
                                ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        allSpeakers = [[NSMutableArray alloc] initWithArray:result];
    }
}

- (void) removeAllSpeakers
{
    NSManagedObjectContext *deleteContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    deleteContext.persistentStoreCoordinator = psc;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [[model entitiesByName] objectForKey:@"Speaker"];
    [request setEntity:entity];
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sd]];
    NSError *error;
    NSArray *result = [deleteContext executeFetchRequest:request error:&error];

    for (Speaker *speaker in result) {
        [deleteContext deleteObject:speaker];
    }
    [deleteContext save:&error];
    [deleteContext reset];
}

@end
