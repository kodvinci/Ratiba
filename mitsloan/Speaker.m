//
//  Speaker.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "Speaker.h"

@implementation Speaker

@synthesize name;
@synthesize contact;
@synthesize bio;
@synthesize id;

-(id) init
{
    if (self == [super init]) {
        [self initDummySpeaker];
    }
    
    return self;
}

-(void) initDummySpeaker
{
    self.name = @"Mimi Jasusi Hodari";
    self.bio = @"Hodari is a serial entrepreneur who has founded many start-ups within the technology industry in Nigeria. He is rumoured to be worth 100 million naira";
    self.contact = [[Contact alloc] init];
}

@end
