    //
//  ViewController.m
//  TabBar
//
//  Created by NYU User on 12/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "View.h"


@implementation ViewController
@synthesize text;

- (id) initWithText: (NSString *) t
	title: (NSString *) title
	image: (UIImage *) image
	badge: (NSString *) badge {
	
	if ((self = [super initWithNibName: nil bundle: nil]) != nil) {
		self.title = title;
		self.tabBarItem.image = image;
		self.tabBarItem.badgeValue = badge;
		self.text = t;		//text = [t copy];
	}
	
	return self;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView {
	CGRect f = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: f controller: self];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
	[text release];	//because we created it with copy
	[super dealloc];
}


@end
