//
//  SpeakerViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakerViewController : UIViewController
{
    IBOutlet UILabel *speakerBio;
    IBOutlet UILabel *speakerContact;
    NSString *bio;
    NSString *name;
}

@property(nonatomic, strong) UILabel *speakerBio;
@property(nonatomic, strong) UILabel *speakerContact;
@property(nonatomic, strong) NSString *bio;
@property(nonatomic, strong) NSString *name;

@end
