//
//  PanelViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/15/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "PanelViewController.h"

@implementation PanelViewController

@synthesize title;
@synthesize blurb;
@synthesize time;
@synthesize location;
@synthesize panelists;
@synthesize titleLabel;
@synthesize timeLabel;
@synthesize blurbLabel;
@synthesize locationLabel;

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
    [self.titleLabel setText:self.title];
    [self.timeLabel setText:self.time];
    [self.blurbLabel setText:self.blurb];
    [self.locationLabel setText:self.location];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
