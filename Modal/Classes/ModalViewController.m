//
//  ModalController.m
//  Modal
//
//  Created by scholar on 3/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ModalViewController.h"
#import "ModalView.h"

@implementation ModalViewController

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self != nil) {
		// Custom initialization
		self.navigationItem.rightBarButtonItem =
		[[UIBarButtonItem alloc] initWithTitle: @"Done"
										 style: UIBarButtonItemStyleDone
										target: self
										action: @selector(dismissModalViewController)];
		
	}
	
	return self;
}

// Create a view hierarchy programmatically, without using a nib.
- (void) loadView {
	CGRect f = [UIScreen mainScreen].applicationFrame;
	self.view = [[ModalView alloc] initWithFrame: f controller: self];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad {
	[super viewDidLoad];
}
*/

- (void) dismissModalViewController {
	[self.parentViewController dismissModalViewControllerAnimated: YES];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation {
	// Return YES for supported orientations
	return YES;
}

- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (void) dealloc {
	[self.view release];
	[super dealloc];
}

@end
