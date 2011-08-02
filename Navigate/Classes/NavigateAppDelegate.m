//
//  NavigateAppDelegate.m
//  Navigate
//
//  Created by Ann McDermott on 7/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "NavigateAppDelegate.h"
#import "StationController.h"

@implementation NavigateAppDelegate
@synthesize window;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {    
	// Override point for customization after application launch
	
	names = [NSArray arrayWithObjects:
		@"Grand Central Terminal",
		@"Harlem-125th St.",
		@"Yankees-E. 153rd St.",
		@"Morris Heights",
		@"University Heights",
		@"Marble Hill",
		@"Spuyten Duyvil",
		@"Riverdale",
		@"Ludlow",
		@"Yonkers",
		@"Glenwood",
		@"Greystone",
		@"Hastings-on-Hudson",
		@"Dobbs Ferry",
		nil
	];
	[names retain];
	
	a = [[NSMutableArray alloc] init];

	[a addObject: [[StationController alloc]
		initWithTitle: [names objectAtIndex: 0]
	]];
	 
	//Put the first station in the navigation controller.
	controller = [[UINavigationController alloc]
		initWithRootViewController: [a objectAtIndex: 0]];

	//Put the navigation controller in the window.
	CGRect f = [UIScreen mainScreen].bounds;
	window = [[UIWindow alloc] initWithFrame: f];
	[window addSubview: controller.view];
	[window makeKeyAndVisible];
	return YES;
}

- (void) nextStation {
	NSUInteger i = controller.viewControllers.count;
	if (i == names.count) {
		//All the station are already pushed.
		return;
	}
	
	if (a.count <= i) {
		//This station is being pushed for the first time.
		[a addObject: [[StationController alloc]
			initWithTitle: [names objectAtIndex: i]
		]];
	}
	
	[controller pushViewController: [a objectAtIndex: i] animated: YES];
}
	 
- (void) dealloc {
	[window release];
	[controller release];
	
	for (StationController *c in a) {
		[c release];
	}
	[a release];

	[names release];
	[super dealloc];
}

@end
