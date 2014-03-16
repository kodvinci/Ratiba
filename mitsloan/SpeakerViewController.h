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
    IBOutlet UITextView *speakerBio;
    IBOutlet UITextView *speakerTitle;
    IBOutlet UIImageView *speakerImage;
    NSString *bio;
    NSString *name;
    NSString *sptitle;
    UIImage *image;
}

@property(nonatomic, strong) UITextView *speakerBio;
@property(nonatomic, strong) UITextView *speakerTitle;
@property(nonatomic, strong) UIImageView *speakerImage;
@property(nonatomic, strong) NSString *bio;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *sptitle;
@property(nonatomic, strong) UIImage *image;

@end
