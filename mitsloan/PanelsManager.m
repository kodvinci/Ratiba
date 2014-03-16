//
//  PanelsManager.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 3/16/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "PanelsManager.h"

static PanelsManager *defaultPanelsManager = nil;

@implementation PanelsManager

+ (PanelsManager *) defaultPanelsManager
{
    if (!defaultPanelsManager) {
        defaultPanelsManager = [[super allocWithZone:NULL] init];
    }
    return defaultPanelsManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultPanelsManager];
}

- (id)init
{
    if (defaultPanelsManager) {
        return defaultPanelsManager;
    }
    self = [super init];
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSString *path = pathInDocumentDirectory(@"panelstore.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
    }
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:persistentStoreCoordinator];
    [context setUndoManager:nil];
    
    //TODO FIX FIX
    //[self removeAllPanels];
    //[self fetchPanelsXml];
    
    return self;
}

- (void) fetchPanelsXml
{
    xmlPanelData = [[NSMutableData alloc] init];
    NSURL *panelsURL = [NSURL URLWithString: @"http://conference-app-backend.appspot.com/serve"];
    NSURLRequest *request = [NSURLRequest requestWithURL:panelsURL];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [xmlPanelData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlPanelData];
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
    if ([elementName isEqual:@"Panel"])
    {
        //NSLog(@"%@ found a %@ element", self, elementName);
        Panel *panel = [NSEntityDescription insertNewObjectForEntityForName:@"Panel" inManagedObjectContext:context];
        [panel setParentParserDelegate:self];
        [parser setDelegate:panel];
        [allPanels addObject:panel];
        [self saveChanges];
    }
}

- (void) removeAllPanels
{
    NSManagedObjectContext *deleteContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    deleteContext.persistentStoreCoordinator = persistentStoreCoordinator;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [[model entitiesByName] objectForKey:@"Panel"];
    [request setEntity:entity];
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sd]];
    NSError *error;
    NSArray *result = [deleteContext executeFetchRequest:request error:&error];
    for (Panel *panel in result) {
        [deleteContext deleteObject:panel];
    }
    [deleteContext save:&error];
    [deleteContext reset];
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

- (NSArray *) allPanels
{
    [self fetchPanelsIfNecessary];
    return allPanels;
}

- (void) fetchPanelsIfNecessary
{
    if (!allPanels) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [[model entitiesByName] objectForKey:@"Panel"];
        [request setEntity:entity];
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result)
        {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        allPanels = [[NSMutableArray alloc] initWithArray:result];
    }
}

@end
