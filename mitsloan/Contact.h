//
//  Contact.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
{
    NSString *email;
    NSString *twitterHandle;
    NSString *telephone;
    NSString *address;
    NSInteger id;
}

@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSString *twitterHandle;
@property(nonatomic, retain) NSString *telephone;
@property(nonatomic, retain) NSString *address;
@property(nonatomic, assign) NSInteger id;

-(id)init;

@end
