//
//  SpeakersViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speaker.h"
#import "SpeakerViewController.h"

@interface SpeakersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *speakersView;
}

@property (strong, nonatomic) UITableView *speakersView;
@property (strong, nonatomic) NSArray *speakersArray;

@end
