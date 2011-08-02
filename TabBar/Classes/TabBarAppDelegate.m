//
//  TabBarAppDelegate.m
//  TabBar
//
//  Created by NYU User on 12/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TabBarAppDelegate.h"
#import "ViewController.h"

@implementation TabBarAppDelegate
@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL) application: (UIApplication *) application
	didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {    
    
	// Override point for customization after application launch.
	tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = [NSArray arrayWithObjects:
								  
		[[ViewController alloc]
			initWithText: @"The Bronx is up and the Battery’s down!"
			title: @"The Bronx"
			image: [UIImage imageNamed: @"bronx.png"]
			badge: nil
		],
								  
		[[ViewController alloc]
			initWithText: @"How sweet it is!"
			title: @"Brooklyn"
			image: [UIImage imageNamed: @"brooklyn.png"]
			badge: nil
		],
								  
		[[ViewController alloc]
			initWithText: @"People ride in a hole in the ground!"
			title: @"Manhattan"
			image: [UIImage imageNamed: @"manhattan.png"]
			badge: @"4,5,6"
		],
								  
		[[ViewController alloc]
			initWithText: @"Bob Moses was a genius!"
			title: @"Queens"
			image: [UIImage imageNamed: @"queens.png"]
			badge: @"E"
		],
								  
		[[ViewController alloc]
			initWithText: @"Is dat an Island?"
			title: @"Staten Island"
			image: [UIImage imageNamed: @"statenisland.png"]
			badge: nil
		],
								  
		nil
	];
	
	UIScreen *s = [UIScreen mainScreen];
	window = [[UIWindow alloc] initWithFrame: s.bounds];
	[window addSubview: tabBarController.view];
	[window makeKeyAndVisible];
	
	return YES;
}


- (void) applicationWillResignActive: (UIApplication *) application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void) applicationDidEnterBackground: (UIApplication *) application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void) applicationWillEnterForeground: (UIApplication *) application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void) applicationDidBecomeActive: (UIApplication *) application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void) applicationWillTerminate: (UIApplication *) application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void) applicationDidReceiveMemoryWarning: (UIApplication *) application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void) dealloc {
	[window release];
	[tabBarController release];

	for (ViewController *c in tabBarController.viewControllers) {
		[c release];
	}

	[super dealloc];
}

@end
