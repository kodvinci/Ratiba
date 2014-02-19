//
//  Panel.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Panel : NSObject
{
    NSString *title;
    NSString *location;
    NSMutableArray *speakers;
    NSString *blurb;
    NSDate *startTime;
    NSDate *endTime;
    NSInteger id;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *location;
@property(nonatomic, retain) NSMutableArray *speakers;
@property(nonatomic, retain) NSString *blurb;
@property(nonatomic, retain) NSDate *startTime;
@property(nonatomic, retain) NSDate *endTime;
@property(nonatomic, assign) NSInteger id;


-(id)init;

@end
