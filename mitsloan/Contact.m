//
//  Contact.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize email;
@synthesize twitterHandle;
@synthesize telephone;
@synthesize address;
@synthesize id;

-(id) init
{
    if (self == [super init]) {
        [self initDummyContact];
    }
    
    return self;
}

-(void) initDummyContact
{
    self.email = @"hodari@yahoo.com";
    self.telephone = @"919-111-6444";
    self.twitterHandle = @"tweetler";
    self.address = @"Nyumbani Lane, Keja 101";
}

@end
