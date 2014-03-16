//
//  SpeakerViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "SpeakerViewController.h"

@implementation SpeakerViewController

@synthesize speakerBio;
@synthesize speakerTitle;
@synthesize bio;
@synthesize name;
@synthesize sptitle;
@synthesize speakerImage;
@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.name;
	[self.speakerBio setText:self.bio];
    [self.speakerTitle setText:self.sptitle];
    [self.speakerImage setImage:self.image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
