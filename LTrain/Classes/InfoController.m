//
//  InfoController.m
//  LTrain
//
//  Created by scholar on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoController.h"
#import "InfoView.h"

@implementation InfoController
@synthesize information;

- (void) back {
	//self.parentViewController is a navigation controller.
	//self.parentViewController.parentViewController is a StationController.

	[self.parentViewController.parentViewController
		dismissModalViewControllerAnimated: YES];
}

- (id) initWithTitle: (NSString *) title information: (NSString *) i {
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		// Custom initialization
		self.title = title;

		self.navigationItem.rightBarButtonItem =
			[[UIBarButtonItem alloc] initWithTitle: @"go back"
				style: UIBarButtonItemStylePlain
				target: self
				action: @selector(back)
			];
		
		information = i;
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
	self.view = [[InfoView alloc] initWithFrame: f information: information];
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
	[information release];
	[super dealloc];
}

@end
