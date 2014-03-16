//
//  Panel.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Panel : NSManagedObject <NSXMLParserDelegate>
{
    NSMutableString *currentString;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *location;
@property(nonatomic, retain) NSMutableArray *speakers;
@property(nonatomic, retain) NSString *blurb;
@property(nonatomic, retain) NSString *startTime;
@property(nonatomic, retain) NSString *endTime;
@property(nonatomic, assign) NSInteger id;
@property(nonatomic, assign) NSString *theme;
@property (nonatomic, assign) id parentParserDelegate;
@property (nonatomic, retain) NSNumber * orderingValue;

@end
