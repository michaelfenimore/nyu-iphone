//
//  StationController.m
//  LTrain
//
//  Created by scholar on 7/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationController.h"
#import "LTrainAppDelegate.h"
#import "StationView.h"
#import "InfoController.h"

@implementation StationController

//Called by the nextLevel method of class StationView.

- (void) nextStation {
	UIApplication *a = [UIApplication sharedApplication];
	LTrainAppDelegate *d = a.delegate;
	[d nextStation];
}

- (id) initWithTitle: (NSString *) title easternNeighbor: (BOOL) b {
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		// Custom initialization
		self.title = title;
		
		if (b) {
			self.navigationItem.rightBarButtonItem =
				[[UIBarButtonItem alloc] initWithTitle: @"go east"
					style: UIBarButtonItemStylePlain
					target: self
					action: @selector(nextStation)
				];
		}
	}
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Create a view hierarchy programmatically, without using a nib.
- (void) loadView {
	CGRect f = [UIScreen mainScreen].applicationFrame;
	self.view = [[StationView alloc] initWithFrame: f controller: self];
}

- (void) moreInfo {
	[[UIApplication sharedApplication].delegate moreInfo: self];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

// Allow orientations other than the default portrait orientation.
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) dealloc {
	[self.view release];
	[super dealloc];
}

@end
