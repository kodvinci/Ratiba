//
//  FirstViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "ScheduleViewController.h"

@implementation ScheduleViewController

@synthesize scheduleView;
@synthesize scheduleArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Schedule";
	self.scheduleView.dataSource = self;
    self.scheduleView.delegate = self;
    self.scheduleArray = [self getAllPanels];
}

-(NSArray *) getAllPanels
{
    PanelsManager *panelsManager = [[PanelsManager alloc] init];
    return [panelsManager allPanels];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.scheduleArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    Panel *panel = [self.scheduleArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:panel.title];
    [cell.detailTextLabel setText:[self getTime:panel.startTime :panel.endTime]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PanelViewController *panelView = [self.storyboard instantiateViewControllerWithIdentifier:@"PanelViewController"];
    Panel *myPanel = [self.scheduleArray objectAtIndex:indexPath.row];
    panelView.ptitle = myPanel.title;
    panelView.location = myPanel.location;
    panelView.blurb = myPanel.blurb;
    panelView.time = [self getTime:myPanel.startTime :myPanel.endTime];
    panelView.panelists = myPanel.speakers;
    panelView.theme = myPanel.theme;
    [self.navigationController pushViewController:panelView animated:YES];
}

-(NSString *) getTime:(NSString *) startTime :(NSString *) endTime
{
    NSMutableString *time = [[NSMutableString alloc] init];
    if (startTime != nil && endTime != nil)
    {
        [time appendString:startTime];
        [time appendString:@" - "];
        [time appendString:endTime];
    }
    return time;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
