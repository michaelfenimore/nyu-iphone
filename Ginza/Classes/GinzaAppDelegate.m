//
//  GinzaAppDelegate.m
//  Ginza
//
//  Created by Michael Fenimore on 8/1/11.
//  Copyright 2011 --MichaelFenimore--. All rights reserved.
//

#import "GinzaAppDelegate.h"
#import "StationController.h"

@implementation GinzaAppDelegate
@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {    
	// Override point for customization after application launch
	
	stationNames = [NSArray arrayWithObjects:
					@"Shibuya",
					@"Gaienmae",
					@"Aoyama-Itchome",
					@"Akasaka-Mitsuke",
					@"Tameikesanno",
					@"Tora-Nomon",
					@"Shimbashi",
					@"Ginza",
					@"Kyobashi",
					@"Nihonbashi",
					@"Mitukoshimae",
					@"Kanda",
					@"Suehirocho",
					@"Uenohirokoji",
					@"Ueno",
					@"Nakaokachi-machi",
					@"Tawaramachi",
					@"Asakusa",
					nil
					];
	[stationNames retain];
	
	stationImages = [NSArray arrayWithObjects:
					 @"station0.png",
					 @"station1.png",
					 @"station2.png",
					 @"station3.png",
					 nil
					 ];
	
	a = [[NSMutableArray alloc] init];
	
	[a addObject: [[StationController alloc]
				   initWithTitle: [stationNames objectAtIndex: 0]
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
	if (i == stationNames.count) {
		//All the station are already pushed.
		return;
	}
	
	if (a.count <= i) {
		//This station is being pushed for the first time.
		[a addObject: [[StationController alloc]
					   initWithTitle: [stationNames objectAtIndex: i]
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
	
	[stationNames release];
	[super dealloc];
}


@end
