//
//  Panel.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "Panel.h"

@implementation Panel

@synthesize title;
@synthesize location;
@synthesize speakers;
@synthesize blurb;
@synthesize startTime;
@synthesize endTime;
@synthesize id;

-(id) init
{
    if (self == [super init]) {
        [self initDefaultAttributes];
        //Initialize using the json data from the backend
    }
    return self;
}

-(void) initDefaultAttributes
{
    self.title = @"Mobile Tech in Africa";
    self.location = @"Gross Hall, 140 Science Drive";
    self.speakers = [[NSMutableArray alloc] initWithObjects:
                     @"James Mwangi",
                     @"Lee Njiru",
                     @"Edwin Rotich",
                     nil];
    self.blurb = @"This is a panel about the rise of mobile technology in Africa";
    self.startTime = [NSDate date];
    self.endTime = [NSDate date];
}

@end
