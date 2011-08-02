//
//  MainController.m
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "ModalViewController.h"

@implementation MainViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self != nil) {
		// Custom initialization
	}
	return self;
}
*/

// Create a view hierarchy programmatically, without using a nib.
- (void) loadView {
	CGRect f = [UIScreen mainScreen].applicationFrame;
	self.view = [[MainView alloc] initWithFrame: f controller: self];
}

- (void) presentModalViewController {
	if (modalViewController == nil) {
		modalViewController =
			[[ModalViewController alloc] initWithNibName: nil bundle: nil];
	}
	//[self presentModalViewController: modalViewController animated: YES];
	[self presentModalViewController:
	 [[UINavigationController alloc] initWithRootViewController: modalViewController]
							animated: YES];	
}

- (void) dismissModalViewController {
	[self dismissModalViewControllerAnimated: YES];
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
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (void) dealloc {
	[self dismissModalViewController];
	[modalViewController release];
	[self.view release];
	[super dealloc];
}

@end
