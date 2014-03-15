//
//  DataManager.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 3/2/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "SpeakerDataManager.h"

static SpeakerDataManager *defaultDataManager = nil;

@implementation SpeakerDataManager

+ (SpeakerDataManager *) defaultDataManager
{
    if (!defaultDataManager) {
        // Create the singleton
        defaultDataManager = [[super allocWithZone:NULL] init];
    }
    return defaultDataManager;
}

// Prevent creation of additional instances
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
    NSPersistentStoreCoordinator *psc =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSString *path = pathInDocumentDirectory(@"store.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    
    NSError *error = nil;
    
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:storeURL
                                 options:nil
                                   error:&error]) {
        [NSException raise:@"Open failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    
    [context setUndoManager:nil];
    
    [self fetchSpeakersXml];
    
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
    //NSLog(@"%@ found a %@ element", self, elementName);
    if ([elementName isEqual:@"Speaker"]) {
       // NSLog(@"%@ found a %@ element", self, elementName);
        Speaker *speaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speaker" inManagedObjectContext:context];
        [speaker setParentParserDelegate:self];
        [parser setDelegate:speaker];
        
        [allSpeakers addObject:speaker];
        [self saveChanges]; //TODO
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
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        allSpeakers = [[NSMutableArray alloc] initWithArray:result];
    }
}

- (Speaker *)createSpeaker
{
    [self fetchSpeakersIfNecessary];
    double order;
    if ([allSpeakers count] == 0) {
        order = 1.0;
    } else {
        order = [[[allSpeakers lastObject] orderingValue] doubleValue] + 1.0;
    }
    NSLog(@"Adding after %d items, order = %.2f",[allSpeakers count], order);
    Speaker *p = [NSEntityDescription insertNewObjectForEntityForName:@"Speaker" inManagedObjectContext:context];
    [self assingDummyAttrsToSpeaker:p]; //TODO delete
    [p setOrderingValue:[NSNumber numberWithDouble:order]];
    [allSpeakers addObject:p];
    return p;
}

-(void) assingDummyAttrsToSpeaker: (Speaker *) sp
{
    sp.name = @"Dummy Speaker";
    sp.bio = @"He is an awesome speaker";
    sp.title = @"His Excellency";
}

@end
