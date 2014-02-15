//
//  PanelViewController.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/15/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanelViewController : UIViewController
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *blurbLabel;
    IBOutlet UILabel *locationLabel;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *blurb;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSArray *panelists;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *blurbLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

@end
