//
//  ModalAppDelegate.m
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ModalAppDelegate.h"
#import "MainViewController.h"

@implementation ModalAppDelegate
@synthesize window;

- (void) applicationDidFinishLaunching: (UIApplication *) application {    
	// Override point for customization after application launch
	controller = [[MainViewController alloc] initWithNibName: nil bundle: nil];
	window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	[window addSubview: controller.view];
	[window makeKeyAndVisible];
}

- (void) dealloc {
	[window release];
	[controller release];
	[super dealloc];
}

@end
