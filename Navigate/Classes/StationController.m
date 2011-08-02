    //
//  StationController.m
//  Navigate
//
//  Created by Ann McDermott on 7/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationController.h"
#import "NavigateAppDelegate.h"
#import "StationView.h"

@implementation StationController

- (id) initWithTitle: (NSString *) title {
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		// Custom initialization
		self.title = title;
	}
	return self;
}

/*
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self != nil) {
		// Custom initialization
	}
	return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView {
	CGRect f = [UIScreen mainScreen].applicationFrame;
	self.view = [[StationView alloc] initWithFrame: f controller: self];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad {
	[super viewDidLoad];
}
*/

//Called by the nextLevel method of class StationView.

- (void) nextStation {
	UIApplication *a = [UIApplication sharedApplication];
	NavigateAppDelegate *d = a.delegate;
	[d nextStation];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation {
	// Return YES for supported orientations
	return YES;
}

- (void) didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

- (void) viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) dealloc {
	[self.view release];
	[super dealloc];
}

@end
