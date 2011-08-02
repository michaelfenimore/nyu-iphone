//
//  LTrainAppDelegate.m
//  LTrain
//
//  Created by scholar on 7/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "LTrainAppDelegate.h"
#import "StationController.h"
#import "InfoController.h"

@implementation LTrainAppDelegate
@synthesize window;

- (void) applicationDidFinishLaunching: (UIApplication *) application {    
	// Override point for customization after application launch
	names = [NSArray arrayWithObjects:
		@"8th Avenue",
		@"6th Avenue",
		@"Union Square",
		@"3rd Avenue",
		@"1st Avenue",
		nil
	];
	[names retain];
	
	information = [NSDictionary dictionaryWithObjectsAndKeys:
		@"Transfer for A, C, E.",   @"8th Avenue",
		@"Transfer for B, D, F.",   @"6th Avenue",
		@"Transfer for N, R.",      @"Union Square",
		@"No transfers.",          @"3rd Avenue",
		@"1st Avenue has a bike lane.", @"1st Avenue", 
		nil
	];
	[information retain];

	a = [[NSMutableArray alloc] init];
	
	[a addObject: [[StationController alloc]
		initWithTitle: [names objectAtIndex: 0]
		easternNeighbor: names.count > 1
	]];
	
	//Put the first station into the navigation controller.
	controller = [[UINavigationController alloc]
		initWithRootViewController: [a objectAtIndex: 0]];

	//Put the navigation controller into the window.
	CGRect f = [UIScreen mainScreen].bounds;
	window = [[UIWindow alloc] initWithFrame: f];
	[window addSubview: controller.view];
	[window makeKeyAndVisible];
}

- (void) nextStation {
	NSUInteger i = controller.viewControllers.count;
	if (i == names.count) {
		//All the stations are already pushed.
		return;
	}
	
	if (a.count <= i) {
		//This station is being pushed for the first time.
		[a addObject: [[StationController alloc]
			initWithTitle: [names objectAtIndex: i]
			easternNeighbor: i < names.count - 1
		]];
	}
	
	[controller pushViewController: [a objectAtIndex: i] animated: YES];
}

- (void) moreInfo: (StationController *) sc {
	UIViewController *c = [[InfoController alloc]
		initWithTitle: sc.title
		information: [information objectForKey: sc.title]];
	
	c = [[UINavigationController alloc] initWithRootViewController: c];
	[sc presentModalViewController: c animated: YES];
}


- (void) dealloc {
	[window release];

	for (StationController *c in a) {
		[c release];
	}
	[a release];
	
	[information release];
	[names release];
	[super dealloc];
}

@end
