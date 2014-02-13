//
//  AppDelegate.h
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *tabBarController;
	ScheduleViewController *scheduleView;
}


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) ScheduleViewController *scheduleView;

@end
