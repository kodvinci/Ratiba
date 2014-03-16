//
//  Panel.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "Panel.h"

@implementation Panel

@dynamic title;
@dynamic location;
@dynamic speakers;
@dynamic blurb;
@dynamic startTime;
@dynamic endTime;
@dynamic id;
@dynamic theme;
@synthesize parentParserDelegate;
@dynamic orderingValue;

- (void) awakeFromFetch
{
    [super awakeFromFetch];
}

- (void) awakeFromInsert
{
    [super awakeFromInsert];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"Title"]) {
        currentString = [[NSMutableString alloc] init];
        self.title = currentString;
    }
    else if ([elementName isEqual:@"Blurb"]) {
        currentString = [[NSMutableString alloc] init];
        self.blurb = currentString;
    }
    else if ([elementName isEqual:@"Location"]) {
        currentString = [[NSMutableString alloc] init];
        self.location = currentString;
    }
    else if ([elementName isEqual:@"Theme"]) {
        currentString = [[NSMutableString alloc] init];
        self.theme = currentString;
    }
    else if ([elementName isEqual:@"StartTime"]) {
        currentString = [[NSMutableString alloc] init];
        self.startTime = currentString;
    }
    else if ([elementName isEqual:@"EndTime"]) {
        currentString = [[NSMutableString alloc] init];
        self.endTime = currentString;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqual:@"Panel"])
        [parser setDelegate:parentParserDelegate];
}

@end
