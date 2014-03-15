//
//  Speaker.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/27/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "Speaker.h"


@implementation Speaker

@dynamic name;
@dynamic id;
@dynamic title;
@dynamic bio;
@dynamic imageData;
@dynamic image;
@dynamic orderingValue;
@dynamic panels;
@synthesize parentParserDelegate;

- (void) awakeFromFetch
{
    [super awakeFromFetch];
    UIImage *tn = [UIImage imageWithData:[self imageData]];
    [self setPrimitiveValue:tn forKey:@"image"];
}

- (void) awakeFromInsert
{
    [super awakeFromInsert];
    // when objects are added to the db, they are sent the message awakeFromInsert
}

- (void) setThumbnailDataFromImage:(UIImage *)image
{
    CGSize originalImageSize = [image size];
    CGRect newRect;
    newRect.origin = CGPointZero;
    newRect.size = [[self class] thumbnailSize];
    float ratio = MAX(newRect.size.width/originalImageSize.width, newRect.size.height/originalImageSize.height);
    UIGraphicsBeginImageContext(newRect.size);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: newRect cornerRadius:5.0];
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width)/2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height)/2.0;
    
    [image drawInRect:projectRect];
    UIImage *small = UIGraphicsGetImageFromCurrentImageContext();
    [self setImage:small];
    
    NSData *data = UIImagePNGRepresentation(small);
    [self setImageData:data];
    
    UIGraphicsEndImageContext();
    
}

+ (CGSize) thumbnailSize
{
    return CGSizeMake(40, 40);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"Name"]) {
        currentString = [[NSMutableString alloc] init];
        self.name = currentString;
    }
    else if ([elementName isEqual:@"Bio"]) {
        currentString = [[NSMutableString alloc] init];
        self.bio = currentString;
    }
    else if ([elementName isEqual:@"Title"]) {
        currentString = [[NSMutableString alloc] init];
        self.title = currentString;
    }
    else if ([elementName isEqual:@"Image"]) {
        //currentString = [[NSMutableString alloc] init];
        //self.bio = currentString;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
   // currentString = nil;
    if ([elementName isEqual:@"Speaker"])
        [parser setDelegate:parentParserDelegate];
}

@end
