//
//  Speaker.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface Speaker : NSObject
{
    NSString *name;
    NSString *bio;
    Contact *contact;
    NSInteger id;
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *bio;
@property(nonatomic, retain) Contact *contact;
@property(nonatomic, assign) NSInteger id;


-(id)init;

@end
