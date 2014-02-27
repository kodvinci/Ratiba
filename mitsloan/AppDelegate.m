//
//  AppDelegate.m
//  mitsloan
//
//  Created by Leonard Ng'eno on 2/13/14.
//  Copyright (c) 2014 Leonard Ng'eno. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window;
@synthesize tabBarController;
@synthesize scheduleView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    [self setTabBarAppearance];
    [self setNavigationBarAppearance];
	scheduleView = [[ScheduleViewController alloc] init];
	[window addSubview:tabBarController.view];
	[self.tabBarController presentViewController:scheduleView animated:NO completion:nil];
    return YES;
}

-(void) setTabBarAppearance
{
    [[UITabBar appearance] setTintColor:[UIColor greenColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
}

-(void) setNavigationBarAppearance
{
    [[UINavigationBar appearance] setTintColor:[UIColor greenColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) dealloc
{
    
}

@end
