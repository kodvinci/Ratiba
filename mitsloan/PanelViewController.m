//
//  PanelViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/15/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "PanelViewController.h"

@implementation PanelViewController

@synthesize ptitle;
@synthesize blurb;
@synthesize time;
@synthesize location;
@synthesize panelists;
@synthesize timeLabel;
@synthesize blurbLabel;
@synthesize locationLabel;
@synthesize panelistsView;
@synthesize speakersLabel;
@synthesize feedbackButton;
@synthesize theme;
@synthesize themeLabel;

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
    self.title = self.ptitle;
    self.panelistsView.dataSource = self;
    [self.timeLabel setText:self.time];
    [self.blurbLabel setText:self.blurb];
    [self.locationLabel setText:self.location];
    [self.speakersLabel setText:@"Panelists"];
    [self.themeLabel setText:self.theme];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.panelists count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *speaker = [self.panelists objectAtIndex:indexPath.row];
    [cell.textLabel setText:speaker];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)sendFeedback
{
    FeedbackViewController *feedbackView = [self.storyboard instantiateViewControllerWithIdentifier:@"FeedbackViewController"];
    [self.navigationController pushViewController:feedbackView animated:YES];
}

@end
