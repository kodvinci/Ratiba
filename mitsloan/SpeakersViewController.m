//
//  SpeakersViewController.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "SpeakersViewController.h"

@implementation SpeakersViewController

@synthesize speakersView;
@synthesize speakersArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Speakers";
	self.speakersView.dataSource = self;
    self.speakersView.delegate = self;
    self.speakersArray =[self getAllSpeakers];
}

-(NSArray *) getAllSpeakers
{
    SpeakersManager *dataManager = [[SpeakersManager alloc] init];
    return [dataManager allSpeakers];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.speakersArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    Speaker *panelist = [self.speakersArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:panelist.name];
    [cell.detailTextLabel setText:panelist.title];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpeakerViewController *speakerView = [self.storyboard instantiateViewControllerWithIdentifier:@"SpeakerViewController"];
    Speaker *speaker = [self.speakersArray objectAtIndex:indexPath.row];
    [speaker awakeFromFetch];
    speakerView.bio = speaker.bio;
    speakerView.name = speaker.name;
    speakerView.sptitle = speaker.title;
    speakerView.image = speaker.image;
    [self.navigationController pushViewController:speakerView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
