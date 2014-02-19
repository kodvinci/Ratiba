//
//  FeedbackViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/19/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "FeedbackViewController.h"

@implementation FeedbackViewController

@synthesize feedbackView;
@synthesize feedbackLabel;
@synthesize feedbackButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.feedbackLabel setText:@"please leave your feedback below"];
    [self.feedbackView setText:@"The panel was ...."];
    
}

-(IBAction)submitFeedback
{
    //Send back feed to the backend!
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
