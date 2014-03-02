//
//  Speaker.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/27/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Speaker : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) UIImage * image;
@property (nonatomic, retain) NSNumber * orderingValue;
@property (nonatomic, retain) NSManagedObject *panels;

- (void) setThumbnailDataFromImage:(UIImage *)image;
+ (CGSize) thumbnailSize;

@end
